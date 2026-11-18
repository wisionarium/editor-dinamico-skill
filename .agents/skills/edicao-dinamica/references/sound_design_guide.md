# Guia de Sound Design e Mixagem para Edição Dinâmica

O design de áudio é responsável por 50% da retenção e percepção de qualidade técnica de um vídeo vertical. Este guia define a calibração de frequências, mixagem e efeitos sonoros.

---

## 1. Padrões de Mixagem e Níveis em dB (Loudness Targets)

Para Reels, TikTok e YouTube Shorts, os níveis de masterização recomendados são:

Elemento de Áudio | Volume de Pico (True Peak) | Nível Integrado (LUFS) | Compressão & Tratamento
:--- | :--- | :--- | :---
**Voz Principal (A-Roll)** | `-1.0 dB` a `-0.5 dB` | `-14 LUFS` a `-16 LUFS` | High-pass em 80Hz, De-Esser em 6-7kHz, Compressor leve (Ratio 3:1)
**Trilha Sonora (BGM)** | `-18.0 dB` a `-24.0 dB` | `-26 LUFS` a `-30 LUFS` | EQ em 'sorriso' com corte na faixa de 1kHz a 3kHz (espaço da voz)
**SFX Sincronizados (Clicks/Pops)** | `-8.0 dB` a `-14.0 dB` | N/A (pico curto) | Frequência controlada, sem agudos ásperos acima de 8kHz
**Risers / Transições de Clímax** | `-10.0 dB` a `-15.0 dB` | N/A (crescendo) | Fade-out rápido logo antes do corte da frase de impacto

---

## 2. Ducking Automático (Sidechain da Voz na Música)

A trilha sonora **nunca** deve competir com a clareza da voz do apresentador.
* **Ajuste de Ducking**:
  * **Threshold**: Quando a voz passa de `-28 dB`, a música é atenuada em `-4 dB` a `-7 dB`.
  * **Attack**: `20ms` (atenuação rápida e transparente).
  * **Release**: `250ms` a `400ms` (retorno suave da música nos micropensamentos e respirações).
* **Nos cortes de silêncio**: Quando entra um B-Roll mudo ou tela editorial sem fala, a música sobe automaticamente em volume normal (`-14 dB` a `-16 dB`) durante aquele 1.5s, mantendo a energia alta.

---

## 3. Catálogo de SFX (Efeitos Sonoros) e Momentos de Aplicação

Tipo de SFX | Característica Sonora | Quando Aplicar | Volume Sugerido
:--- | :--- | :--- | :---
**UI Click / Keyboard Tap** | Click mecânico suave, curto e seco | Aparição de palavras-chave, botões, toggles | `-12 dB`
**Bubble Pop / Soft Pop** | Plop orgânico de ar macio | Aparição de badges de texto ou ícones redondos | `-14 dB`
**Paper Slide / Texture** | Som de folha de papel passando ou raspando | Transições de tela editorial e grids brancos | `-16 dB`
**Camera Shutter** | Obturador de câmera analógica rápida | B-rolls polaroid, congelamentos de tela e prints | `-10 dB`
**Smooth Whoosh / Air Swoosh** | Deslocamento de ar limpo sem chiado metálico | Zooms rápidos (punch-in), transições de split screen | `-15 dB`
**Deep Impact / Sub Thud** | Batida grave de baixa frequência (60-90Hz) | Revelação de ganchos impactantes ou frases de tese | `-11 dB`

---

## 4. Regra de Ouro contra Fadiga Auditiva (Estilo 3 - Pilar 3)

* **O Erro**: Colocar um som estridente em cada palavra falada. Se o vídeo tem 120 palavras, colocar 120 clicks destrói a experiência do usuário.
* **A Regra dos Picos Estratégicos**:
  * Em um vídeo de 30 a 60 segundos, aplique SFX em no máximo **5 a 8 eventos sonoros**.
  * Cada SFX deve sinalizar uma **mudança real de estado mental**: um novo tópico, uma virada dramática, uma quebra de expectativa ou a CTA final.
