<#
.SYNOPSIS
    Pipeline Completo de Edição Dinâmica de Reels (Do Bruto ao Final).
.DESCRIPTION
    1. Executa corte de silêncio se solicitado.
    2. Enquadra em 1080x1920 (modo direto ou modo Card de Luxo sobre fundo bege).
    3. Queima legendas dinâmicas (.ass) com tipografia mista.
    4. Exporta para a pasta Exportados/.
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$InputVideo,

    [Parameter(Mandatory=$false)]
    [string]$SubtitlesFile,

    [Parameter(Mandatory=$false)]
    [string]$OutputVideo = "Exportados\reel_editado_final.mp4",

    [Parameter(Mandatory=$false)]
    [switch]$CutSilence,

    [Parameter(Mandatory=$false)]
    [ValidateSet("fullscreen", "luxury_card")]
    [string]$Style = "fullscreen"
)

if (-not (Test-Path $InputVideo)) {
    Write-Error "Vídeo de entrada não encontrado: $InputVideo"
    exit 1
}

$processedVideo = $InputVideo

# Passo 1: Corte de Silêncio opcional
if ($CutSilence) {
    Write-Host ">>> Executando corte de silêncio..." -ForegroundColor Cyan
    $tempSilenceCut = "temp_clean_audio.mp4"
    $cutScript = Join-Path $PSScriptRoot "detect_and_cut_silence.ps1"
    & powershell -ExecutionPolicy Bypass -File $cutScript -InputFile $InputVideo -OutputFile $tempSilenceCut
    if (Test-Path $tempSilenceCut) {
        $processedVideo = $tempSilenceCut
    }
}

# Prepara pasta de exportação
$outDir = Split-Path $OutputVideo -Parent
if ($outDir -and -not (Test-Path $outDir)) {
    New-Item -ItemType Directory -Force -Path $outDir | Out-Null
}

Write-Host ">>> Renderizando vídeo final no estilo: $Style..." -ForegroundColor Cyan

if ($Style -eq "luxury_card") {
    # Fundo Bege Areia (#D8CBBF) com card centralizado 920x1636 e cantos arredondados
    $vf = "scale=920:1636:force_original_aspect_ratio=decrease,pad=920:1636:(ow-iw)/2:(oh-ih)/2:black"
    if ($SubtitlesFile -and (Test-Path $SubtitlesFile)) {
        $escapedSubs = $SubtitlesFile.Replace('\', '/').Replace(':', '\:')
        $vf += ",subtitles='$escapedSubs'"
    }
    # Compõe sobre fundo 1080x1920 #D8CBBF
    $filterComplex = "color=c=0xD8CBBF:s=1080x1920:d=100[bg]; [0:v]$vf[vid]; [bg][vid]overlay=(W-w)/2:(H-h)/2:shortest=1[outv]"
    & ffmpeg -y -i $processedVideo -filter_complex $filterComplex -map "[outv]" -map "0:a" -c:v libx264 -preset fast -crf 18 -c:a aac -b:a 192k $OutputVideo
} else {
    # Fullscreen 1080x1920 centralizado com crop inteligente
    $vf = "scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920"
    if ($SubtitlesFile -and (Test-Path $SubtitlesFile)) {
        $escapedSubs = $SubtitlesFile.Replace('\', '/').Replace(':', '\:')
        $vf += ",subtitles='$escapedSubs'"
    }
    & ffmpeg -y -i $processedVideo -vf $vf -c:v libx264 -preset fast -crf 18 -c:a aac -b:a 192k $OutputVideo
}

# Limpeza de arquivos temporários
if (Test-Path "temp_clean_audio.mp4") {
    Remove-Item "temp_clean_audio.mp4" -Force -ErrorAction SilentlyContinue
}

if (Test-Path $OutputVideo) {
    Write-Host ">>> VÍDEO EXPORTADO COM SUCESSO EM: $OutputVideo" -ForegroundColor Green
} else {
    Write-Error "Erro na renderização final do vídeo."
}
