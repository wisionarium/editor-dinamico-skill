---
name: edicao-dinamica
description: >-
  Habilidade completa de edição dinâmica estratégica para Reels, TikTok e YouTube Shorts.
  Analisa arquivos brutos do zero, decupa roteiros, remove silêncios e respirações cirurgicamente,
  executa pacing dinâmico (estímulo visual a cada 1.5-2.5s), compõe B-rolls (split screen, cards editoriais,
  motion graphics HUD, punch-in zoom, triptych, P&B dramático), gera legendas dinâmicas de alta retenção
  seguindo a Regra das Duas Tipografias (Sans-serif base + Serifada itálica de destaque) e calibragem de
  sound design tátil, eliminando anti-padrões como glow neon e cores cafonas aleatórias.
---

# Skill de Edição Dinâmica & Pós-Produção Estratégica (Reels do Zero)

Esta skill capacita o agente a atuar como um **Editor Dinâmico Sênior & Especialista em Pós-Produção Estratégica**, transformando qualquer gravação bruta de câmera/celular em um vídeo vertical de alto padrão estético, retenção magnética e posicionamento de luxo/autoridade.

---

## 1. Os 5 Pilares Fundamentais da Edição Dinâmica

Com base na decupagem dos estilos de referência (`Referencias/estilo 1.mp4` a `estilo 4.mp4`):

1. **Corte Cirúrgico de Silêncio (Silence Snapping)**:
   * Toda pausa inativa > `0.20s`, hesitação vocal ("ééé", "tipo") ou respiração profunda é eliminada.
   * Transições fluidas com padding de 40ms a 60ms para preservar o início e o fim natural das palavras.
2. **Pacing de Alta Retenção (A Regra dos 2 Segundos)**:
   * Nenhum plano contínuo permanece estático por mais de 2.5 segundos.
   * Alternância cíclica: *A-Roll (100%) -> Punch-in (112%) -> B-Roll contextual -> Tela Editorial -> Split Screen*.
3. **A Regra das Duas Tipografias (Dual Typography)**:
   * **80% do texto**: Tipografia Base limpa, moderna e legível (Sans-serif geométrica).
   * **20% das palavras (palavras-chave)**: Tipografia de Destaque sofisticada (Serifada editorial, itálica fluida ou cursiva nobre).
   * **Hierarquia visual**: A palavra de destaque ganha escala (1.3x a 1.5x) e cor de contraste da paleta.
4. **Composição em Card Flutuante de Luxo (Layout Framing)**:
   * Vídeo emoldurado em cartão com cantos arredondados (`border-radius: 24-32px`) sobre fundo aquecido (bege/linho/areia) com sombra suave.
5. **Sound Design Tátil e Orgânico**:
   * Áudio da voz calibrado em `-1dB True Peak` e `-14 LUFS`.
   * Trilha sonora em ducking automático (`-18dB` a `-24dB`).
   * SFX mecânicos sutis (`pop`, `click`, `paper slide`, `swoosh`) apenas nas 5 a 8 viradas capitais do vídeo.

---

## 2. Anti-Padrões Proibidos (O que NUNCA fazer)

Conforme instruído e demonstrado nos **Estilos 3 e 4**:
* ❌ **NUNCA usar Efeito Glow Neon Exagerado**: Textos com borrão fluorescente azul, rosa ou verde neon estilo modelo grátis de app genérico.
* ❌ **NUNCA usar Cores Aleatórias por Palavra (Efeito Karaokê Infantil)**: Mudar de vermelho para amarelo para azul a cada sílaba sem motivo editorial.
* ❌ **NUNCA usar Fontes Pesadas e Desengonçadas**: Fontes sem kerning profissional, fontes cartunescas ou Comic Sans em vídeos de negócios/autoridade.
* ❌ **NUNCA usar Legendas Perdidas ou que Tampem o Rosto**: Cobrir queixo, boca ou olhos do locutor, ou invadir a área de interface dos apps (Safe Zones).
* ❌ **NUNCA usar Poluição Sonora de SFX**: Colocar swoosh ou click em todas as palavras (máximo de 5 a 8 SFX por vídeo).

> Consulte o guia detalhado em: [references/anti_padroes_legendas.md](./references/anti_padroes_legendas.md)

---

## 3. Protocolo Passo a Passo: Do Vídeo Bruto ao Reel Final

### Fase 1: Análise e Decupagem do Bruto
1. Receba o vídeo bruto na pasta do projeto ou caminho informado pelo usuário.
2. Inspecione resolução, fps e duração usando `ffprobe`.
3. Ouça o áudio e mapeie os takes:
   * Identifique ganchos falados, erros de gravação e repetições de frases.
   * Em caso de repetição, **mantenha o último take** (que é o take corrigido).
4. Elabore a linha do tempo do roteiro no formato de blocos de 2 segundos.
   > Modelo de roteiro: [examples/exemplo_roteiro_decupado.json](./examples/exemplo_roteiro_decupado.json)

### Fase 2: Corte Automatizado de Silêncios
1. Execute o script PowerShell de detecção e corte:
   ```powershell
   powershell -ExecutionPolicy Bypass -File .agents/skills/edicao-dinamica/scripts/detect_and_cut_silence.ps1 -InputFile "caminho/do/bruto.mp4" -OutputFile "temp_sem_silencio.mp4" -NoiseThreshold "-30dB" -MinSilenceDuration 0.25
   ```
2. Verifique a nova duração e confirme a fluidez da fala.

### Fase 3: Planejamento Visual e B-Rolls
Para cada bloco da fala, defina a estética visual correspondente:
* **Gancho (00:00 - 00:03)**: Punch-in zoom (110%) ou corte seco, legenda no peito ou acima da cabeça com palavra-chave em destaque.
* **Cenas de Tese / Conceito**: Tela Editorial Branca com Grid Arquitetônico e texto centralizado animado (*"Tudo sozinho"*, *"Elas VENDEM significado!"*).
* **Cenas de Exemplo Prático**: Split Screen 50/50 (B-roll de ação em cima + apresentador embaixo).
* **Cenas de Virada / Dor**: Dramatic B&W Zoom (vídeo passa para preto e branco com zoom no olhar por 2 segundos).
* **Cenas de Pilares / Tópicos**: Motion Graphics de Cards UI Glassmorphism flutuantes.
> Receitas visuais completas em: [references/broll_motion_recipes.md](./references/broll_motion_recipes.md)

### Fase 4: Geração de Legendas Dinâmicas (Dual Typography)
1. Crie o arquivo JSON de blocos de legenda especificando o texto e a palavra de destaque (`highlightWord`).
2. Execute o gerador de legendas em formato `.ass`:
   ```powershell
   node .agents/skills/edicao-dinamica/scripts/generate_dynamic_subtitles.js dados_legendas.json legendas.ass
   ```
3. O script injeta automaticamente:
   * Tipografia Base: *Inter / Helvetica* (Branco puro, margem inferior segura).
   * Tipografia de Destaque: *Playfair Display Italic / Cormorant* (Tom Dourado/Areia `&H00C5D9E5`, tamanho 1.4x).
   * Coordenadas das Safe Zones (nível do peito em `y=1200` ou acima da cabeça em `y=420`).

### Fase 5: Renderização Final do Reel
Execute o pipeline unificado de montagem:
* **Modo Fullscreen (1080x1920)**:
  ```powershell
  powershell -ExecutionPolicy Bypass -File .agents/skills/edicao-dinamica/scripts/render_reels_pipeline.ps1 -InputVideo "temp_sem_silencio.mp4" -SubtitlesFile "legendas.ass" -OutputVideo "Exportados/reel_final.mp4" -Style "fullscreen"
  ```
* **Modo Card de Luxo (Estilo Cleverton)**:
  ```powershell
  powershell -ExecutionPolicy Bypass -File .agents/skills/edicao-dinamica/scripts/render_reels_pipeline.ps1 -InputVideo "temp_sem_silencio.mp4" -SubtitlesFile "legendas.ass" -OutputVideo "Exportados/reel_luxury_final.mp4" -Style "luxury_card"
  ```

---

## 4. Recursos e Biblioteca de Suporte

* **Pares Tipográficos Testados**: [resources/font_pairings.json](./resources/font_pairings.json)
* **Paletas Cromáticas Premium**: [resources/color_palettes.json](./resources/color_palettes.json)
* **Coordenadas de Safe Zones (Reels/TikTok/Shorts)**: [resources/safe_zones.json](./resources/safe_zones.json)
* **Decupagem Completa dos 4 Estilos de Referência**: [references/decupagem_estilos_referencia.md](./references/decupagem_estilos_referencia.md)
* **Guia de Sound Design e Calibração de Volumes**: [references/sound_design_guide.md](./references/sound_design_guide.md)

---

## 5. Protocolo de Auto-Evolução Contínua

Esta skill foi arquitetada para **sempre melhorar e se ampliar**:
1. **Adição de Novos Estilos**:
   * Quando o usuário enviar novos vídeos de referência, salve os vídeos em `Referencias/` e extraia frames com `ffmpeg -vf fps=1 Frames/novo_estilo/frame_%03d.jpg`.
   * Analise os frames e documente os novos padrões em `references/decupagem_estilos_referencia.md`.
2. **Atualização de Anti-Padrões**:
   * Todo erro apontado pelo usuário ou vício visual identificado deve ser imediatamente registrado em `references/anti_padroes_legendas.md`.
3. **Novos Presets de Cores e Tipografias**:
   * Novos pares de fontes devem ser cadastrados em `resources/font_pairings.json` e novas paletas em `resources/color_palettes.json`.
4. **Aprimoramento de Scripts**:
   * Scripts auxiliares de automação em `scripts/` recebem novos filtros conforme a evolução das ferramentas (FFmpeg, Node.js, Python, After Effects, DaVinci Resolve ou CapCut).
