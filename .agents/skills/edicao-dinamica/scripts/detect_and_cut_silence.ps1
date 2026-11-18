<#
.SYNOPSIS
    Detecta e remove silêncios de vídeos brutos usando FFmpeg silencedetect.
.DESCRIPTION
    Analisa o áudio do arquivo bruto, detecta pausas superiores ao limiar especificado
    e produz um vídeo contínuo e dinâmico sem respirações mortas ou hesitações.
.PARAMETER InputFile
    Caminho do arquivo de vídeo bruto.
.PARAMETER OutputFile
    Caminho do arquivo de saída com silêncios removidos.
.PARAMETER NoiseThreshold
    Limiar de decibéis para considerar silêncio (padrão: -30dB).
.PARAMETER MinSilenceDuration
    Duração mínima em segundos para considerar silêncio (padrão: 0.25s).
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$InputFile,

    [Parameter(Mandatory=$false)]
    [string]$OutputFile = "temp_sem_silencio.mp4",

    [Parameter(Mandatory=$false)]
    [string]$NoiseThreshold = "-30dB",

    [Parameter(Mandatory=$false)]
    [double]$MinSilenceDuration = 0.25
)

if (-not (Test-Path $InputFile)) {
    Write-Error "Arquivo de entrada não encontrado: $InputFile"
    exit 1
}

Write-Host ">>> Analisando silêncios em: $InputFile (Threshold: $NoiseThreshold, Min: ${MinSilenceDuration}s)..." -ForegroundColor Cyan

# Executa silencedetect no FFmpeg
$silenceLog = & ffmpeg -i $InputFile -af "silencedetect=noise=$NoiseThreshold:d=$MinSilenceDuration" -f null - 2>&1

$silenceStarts = @()
$silenceEnds = @()

foreach ($line in $silenceLog) {
    if ($line -match "silence_start:\s+([0-9\.]+)") {
        $silenceStarts += [double]$matches[1]
    }
    elseif ($line -match "silence_end:\s+([0-9\.]+)") {
        $silenceEnds += [double]$matches[1]
    }
}

Write-Host ">>> Detectados $($silenceStarts.Count) intervalos de silêncio." -ForegroundColor Green

if ($silenceStarts.Count -eq 0) {
    Write-Host "Nenhum silêncio significativo detectado. Copiando arquivo original..." -ForegroundColor Yellow
    Copy-Item $InputFile $OutputFile
    exit 0
}

# Obtém duração total do vídeo
$durationStr = & ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 $InputFile
$totalDuration = [double]$durationStr

# Constrói segmentos com fala (inversão dos silêncios com margem de segurança de 40ms)
$padding = 0.04
$speechSegments = @()
$currentStart = 0.0

for ($i = 0; $i -lt $silenceStarts.Count; $i++) {
    $sStart = $silenceStarts[$i]
    $sEnd = $silenceEnds[$i]

    $segEnd = [Math]::Max(0.0, $sStart + $padding)
    if ($segEnd -gt $currentStart + 0.1) {
        $speechSegments += [PSCustomObject]@{ Start = $currentStart; End = $segEnd }
    }
    $currentStart = [Math]::Max(0.0, $sEnd - $padding)
}

if ($currentStart -lt $totalDuration - 0.1) {
    $speechSegments += [PSCustomObject]@{ Start = $currentStart; End = $totalDuration }
}

Write-Host ">>> Montando $($speechSegments.Count) segmentos de fala ativa..." -ForegroundColor Cyan

# Constrói o filtro complexo do FFmpeg para corte e junção precisa
$filterComplex = ""
$concatInputs = ""

for ($idx = 0; $idx -lt $speechSegments.Count; $idx++) {
    $seg = $speechSegments[$idx]
    $filterComplex += "[0:v]trim=start=$($seg.Start):end=$($seg.End),setpts=PTS-STARTPTS[v$idx]; "
    $filterComplex += "[0:a]atrim=start=$($seg.Start):end=$($seg.End),asetpts=PTS-STARTPTS[a$idx]; "
    $concatInputs += "[v$idx][a$idx]"
}

$filterComplex += "${concatInputs}concat=n=$($speechSegments.Count):v=1:a=1[outv][outa]"

Write-Host ">>> Renderizando corte contínuo de silêncio..." -ForegroundColor Cyan
& ffmpeg -y -i $InputFile -filter_complex $filterComplex -map "[outv]" -map "[outa]" -c:v libx264 -preset fast -crf 18 -c:a aac -b:a 192k $OutputFile

if (Test-Path $OutputFile) {
    $newDurationStr = & ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 $OutputFile
    Write-Host ">>> Concluído com sucesso! Vídeo salvo em: $OutputFile" -ForegroundColor Green
    Write-Host ">>> Duração original: $([Math]::Round($totalDuration, 2))s -> Nova duração: $([Math]::Round([double]$newDurationStr, 2))s" -ForegroundColor Green
} else {
    Write-Error "Falha na renderização do corte de silêncio."
}
