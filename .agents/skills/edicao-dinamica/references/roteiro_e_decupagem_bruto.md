# Análise de Roteiro e Decupagem de Vídeo Bruto

Como receber um vídeo BRUTO cru gravado pelo criador e transformá-lo num roteiro de edição dinâmico e cinematográfico.

---

## 1. Anatomia de um Vídeo Bruto Típico de Reels

Ao receber um arquivo bruto direto da câmera/celular, o vídeo geralmente contém:
1. **Pausas iniciais e finais**: O locutor olhando para a câmera antes de começar, ajeitando o cabelo ou esticando o braço para desligar a gravação.
2. **Falsas partidas e repetições**: O locutor erra uma frase no meio, suspira, dá uma pausa de 2 segundos e repete a mesma frase melhor formulada.
3. **Silêncios e respirações audíveis**: Pausas para pensar entre argumentos, respirações profundas ou hesitações vocais ("ééé", "tipo assim", "né").
4. **Enquadramento estático**: A câmera fica fixa no tripé no mesmo ângulo monótono por 60 segundos.

---

## 2. Passo a Passo da Decupagem e Limpeza

### Passo 1: Transcrição e Identificação de Takes Validados
* Extraia o áudio e transcreva com timestamps precisos.
* Identifique frases repetidas: quando o locutor repete uma frase, **mantenha sempre o último take** (que costuma ser o mais seguro e bem articulado) e descarte a tentativa falha anterior.

### Passo 2: Remoção dos Silêncios Mortos (Silence Snapping)
* Silêncios superiores a `0.20s` (200 milissegundos) devem ser encurtados ou eliminados.
* Margem de segurança de fala (padding): Deixe entre `40ms` e `60ms` antes da primeira consoante e após a última vogal para não "decapitar" o som das palavras.

### Passo 3: Mapeamento Estratégico da Curva de Retenção

Fase do Vídeo | Faixa de Tempo | Objetivo Psicológico | Elementos Visuais Recomendados
:--- | :--- | :--- | :---
**1. Gancho (Hook)** | `00:00 - 00:03` | Parar o scroll imediatamente nos primeiros 2 segundos | Legenda acima da cabeça ou no peito com palavra de impacto em destaque, zoom in rápido ou corte seco imediato na primeira palavra.
**2. Agitação do Problema** | `00:03 - 00:15` | Validar a dor do espectador | Alternar entre apresentador e primeira tela editorial ou grid técnico HUD.
**3. Virada / Tese (The Shift)** | `00:15 - 00:30` | Revelar o segredo ou quebrar uma crença comum | Split screen 50/50, B-Rolls cinematográficos de alta qualidade contextual ou transição para P&B dramático.
**4. Prova & Profundidade** | `00:30 - 00:48` | Demonstrar autoridade técnica e tangibilidade | Cards de UI flutuantes (Glassmorphism), gráficos de linhas, multi-grid de 3 telas simultâneas.
**5. Fechamento e CTA** | `00:48 - 00:60` | Fixar a tese na mente e direcionar ação | Retorno ao apresentador em plano médio com iluminação tratada, legenda em itálico elegante e chamada para comentário ou bio.

---

## 3. Matriz de Decisão: O que exibir a cada segundo?

Nunca deixe o locutor estático no mesmo plano por mais de **2.5 segundos consecutivos**.
Se a fala do apresentador durar 6 segundos seguidos sobre o mesmo assunto:
* **Segundo 0.0 - 2.0**: Apresentador em plano médio (100% de escala).
* **Segundo 2.0 - 4.0**: Punch-in zoom para 112% ou corte para B-Roll contextual em tela cheia / split screen.
* **Segundo 4.0 - 6.0**: Retorno ao plano base ou entrada de card editorial com palavra-chave.
