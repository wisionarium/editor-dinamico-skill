/**
 * Gerador de Legendas Dinâmicas em Formato ASS (Advanced SubStation Alpha)
 * Implementa a Regra das Duas Tipografias (Estilo 3 e 4) e Posicionamento em Safe Zones.
 */

const fs = require('fs');
const path = require('path');

function createAssHeader(options = {}) {
  const width = options.width || 1080;
  const height = options.height || 1920;
  const baseFont = options.baseFont || "Inter";
  const baseSize = options.baseSize || 54;
  const highlightFont = options.highlightFont || "Playfair Display";
  const highlightSize = options.highlightSize || 76;
  const baseColor = options.baseColor || "&H00FFFFFF"; // BGR format in ASS: White
  const highlightColor = options.highlightColor || "&H00C5D9E5"; // BGR format: Champagne/Sand

  return `[Script Info]
Title: Dynamic Reels Subtitles
ScriptType: v4.00+
WrapStyle: 0
ScaledBorderAndShadow: yes
PlayResX: ${width}
PlayResY: ${height}

[V4+ Styles]
Format: Name, Fontname, Fontsize, PrimaryColour, SecondaryColour, OutlineColour, BackColour, Bold, Italic, Underline, StrikeOut, ScaleX, ScaleY, Spacing, Angle, BorderStyle, Outline, Shadow, Alignment, MarginL, MarginR, MarginV, Encoding
Style: Base,${baseFont},${baseSize},${baseColor},&H000000FF,&H00000000,&H80000000,1,0,0,0,100,100,0,0,1,3,1.5,2,60,60,260,1
Style: Highlight,${highlightFont},${highlightSize},${highlightColor},&H000000FF,&H00000000,&H80000000,1,1,0,0,100,100,0,0,1,3.5,2,2,60,60,260,1

[Events]
Format: Layer, Start, End, Style, Name, MarginL, MarginR, MarginV, Effect, Text
`;
}

function formatAssTime(seconds) {
  const hrs = Math.floor(seconds / 3600);
  const mins = Math.floor((seconds % 3600) / 60);
  const secs = seconds % 60;
  const s = Math.floor(secs);
  const cs = Math.floor((secs - s) * 100);

  const pad = (n, z = 2) => String(n).padStart(z, '0');
  return `${hrs}:${pad(mins)}:${pad(s)}.${pad(cs, 2)}`;
}

/**
 * Converte um array de blocos de legenda em eventos do ASS.
 * Cada bloco possui:
 * - start (segundos)
 * - end (segundos)
 * - text (texto completo)
 * - highlightWord (palavra a ser enfatizada com a segunda tipografia)
 * - position: 'chest' (padrão) | 'head' | 'center'
 */
function generateAssContent(subtitles, options = {}) {
  let output = createAssHeader(options);
  const yChest = options.yChest || 1200;
  const yHead = options.yHead || 420;
  const highlightFont = options.highlightFont || "Playfair Display";
  const highlightColor = options.highlightColor || "\\c&HC5D9E5&"; // ASS color tag

  subtitles.forEach((sub, index) => {
    const startTime = formatAssTime(sub.start);
    const endTime = formatAssTime(sub.end);
    const yPos = sub.position === 'head' ? yHead : yChest;
    const posTag = `{\\pos(540,${yPos})}`;

    let lineText = sub.text;
    if (sub.highlightWord && lineText.toLowerCase().includes(sub.highlightWord.toLowerCase())) {
      const regex = new RegExp(`(${sub.highlightWord})`, 'gi');
      lineText = lineText.replace(regex, `{\\fn${highlightFont}\\i1\\fs76${highlightColor}}$1{\\r}`);
    }

    output += `Dialogue: 0,${startTime},${endTime},Base,,0,0,0,,${posTag}${lineText}\n`;
  });

  return output;
}

// Execução CLI se invocado diretamente
if (require.main === module) {
  const args = process.argv.slice(2);
  const inputJson = args[0];
  const outputAss = args[1] || 'subtitles.ass';

  if (!inputJson) {
    console.log("Uso: node generate_dynamic_subtitles.js <dados_legendas.json> [saida.ass]");
    process.exit(1);
  }

  const rawData = fs.readFileSync(inputJson, 'utf-8');
  const subs = JSON.parse(rawData);
  const assText = generateAssContent(subs);
  fs.writeFileSync(outputAss, assText, 'utf-8');
  console.log(`Legenda gerada com sucesso em: ${outputAss}`);
}

module.exports = { generateAssContent, createAssHeader, formatAssTime };
