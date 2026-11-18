# Catálogo de Anti-Padrões de Legenda e Edição

Este documento documenta os erros críticos e vícios visuais identificados nas referências (especialmente nos Estilos 3 e 4), contrastando o que **NUNCA DEVE SER FEITO** com a **SOLUÇÃO PROFISSIONAL DE ALTA RETENÇÃO**.

---

## 1. O Erro do Glow Neon Exagerado (Estilo 4)

### ❌ O que NÃO fazer:
* **Glow/Brilho Difuso Radioativo**: Textos com stroke ou sombra desfocada em tons neon berrantes (ciano saturado `#00FFFF`, magenta `#FF00FF`, verde radioativo) que emitem uma luz borrada ao redor das letras.
* **Por que é destrutivo**:
  * Passa aspecto amador, infantil e barato (estilo "filtro padrão de aplicativo genérico").
  * Reduz drasticamente o contraste das bordas da fonte, tornando a leitura cansativa e borrada.
  * Tira a seriedade e destrói o posicionamento de autoridade ou sofisticação do criador.

### ✅ Como fazer no padrão profissional:
* **Fundo com Contraste Natural**: Use uma vinheta suave nas bordas ou gradiente escuro de 10% a 25% na camada de vídeo inferior se o fundo for claro.
* **Sombra Projetada Suave (Drop Shadow limpa)**: Sombra preta com opacidade entre 40% e 70%, raio de desfoque curto (2 a 4px) e offset de 2px a 3px para baixo.
* **Cores de Destaque Sólidas**: Tons como Amarelo Lima Desaturado (`#DFFF00`), Verde Menta (`#2ECC71`), Ouro Fosco (`#D4AF37`) ou Terracota (`#E07A5F`), sempre em preenchimento sólido sem borrão neon.

---

## 2. A Ilusão das Cores Aleatórias por Palavra ("Efeito Karaokê Infantil")

### ❌ O que NÃO fazer:
* **Arco-íris Desordenado**: Atribuir uma cor diferente a cada palavra (palavra 1 azul, palavra 2 vermelha, palavra 3 amarela, palavra 4 roxa) sem nenhuma lógica semântica.
* **Glow Piscante**: Palavras que mudam de cor a cada milissegundo como uma árvore de natal.
* **Por que é destrutivo**:
  * Sobrecarga cognitiva: o cérebro do espectador tenta decodificar o significado da cor em vez de absorver a mensagem.
  * Desvia o foco visual da linguagem corporal e das expressões do locutor.

### ✅ Como fazer no padrão profissional:
* **Monocromia com Ponto Focal Estratégico**:
  * 80% do texto em **Branco Puro (`#FFFFFF`)** ou **Off-White (`#F7F8FA`)**.
  * Apenas **1 palavra (no máximo 2)** por bloco de fala recebe a cor de destaque da marca.
  * A cor de destaque deve ser intencional: representa a palavra de virada, dor ou desejo.

---

## 3. O Texto Uniforme Monótono (Estilo 3 - Pilar 1)

### ❌ O que NÃO fazer:
* Manter todo o texto na mesma fonte simples, mesmo tamanho, mesma cor e mesmo peso do início ao fim do vídeo.
* **Por que é destrutivo**: O olho humano se acostuma com padrões estáticos em menos de 2 segundos e passa a ignorar o texto, diminuindo a retenção média.

### ✅ Como fazer no padrão profissional (A Regra das Duas Tipografias):
* **Tipografia 1 (Base - 80% do texto)**: Sans-serif geométrica limpa (ex: *Inter*, *Helvetica*, *Neue Montreal*, *SF Pro*), peso Medium/SemiBold.
* **Tipografia 2 (Destaque - 20% do texto)**: Serifada editorial elegante, itálica fluida ou cursiva com personalidade (ex: *Playfair Display Italic*, *Ogg*, *Instrument Serif*, *Recoleta*).
* **Escala Relativa**: A palavra de destaque deve ter escala 1.25x a 1.45x em relação à fonte base.

---

## 4. O Texto Perdido no Espaço (Estilo 3 - Pilar 2)

### ❌ O que NÃO fazer:
* Jogar a legenda aleatoriamente em cantos diferentes a cada take: um take no canto inferior esquerdo, outro colado na borda direita, outro cobrindo a testa, outro no rodapé.
* Posicionar texto sobreposto à boca ou aos olhos do apresentador.
* Invadir as áreas de interface dos apps (botões de like à direita, legenda de texto embaixo).

### ✅ Como fazer no padrão profissional:
* **Âncoras Espaciais Padronizadas**:
  * **Zona Primária (60% dos takes)**: Centro do tórax / peito do apresentador.
  * **Zona Secundária (30% dos takes)**: Acima da cabeça (quando há espaço livre e a fala é uma pergunta ou gancho).
  * **Zona Terceira (10% dos takes)**: Lateral com grid de regra dos terços quando o apresentador aponta para o lado.
* **Alinhamento Centralizado e Justificado**: O bloco textual deve sempre ter um centro de massa estável.

---

## 5. Legendas Rápidas Demais (Flash Word-by-Word)

### ❌ O que NÃO fazer:
* Exibir apenas 1 palavra minúscula por 0.12 segundos que pisca e some instantaneamente ("O" -> "que" -> "você" -> "acha").
* **Por que é destrutivo**: Obriga o cérebro a fazer esforço de leitura taquigráfica, causando cansaço ocular após 5 segundos.

### ✅ Como fazer no padrão profissional:
* **Chunking Semântico**: Apresentar blocos de sentido de **2 a 5 palavras** por exibição (ex: `"O corpo até tenta"` seguido de `"compensar."`).
* Tempo mínimo de tela por bloco: **0.6s a 1.4s**, permitindo leitura fluida e natural sincronizada com a respiração da fala.

---

## 6. Poluição Sonora nos Efeitos Sonoros (Estilo 3 - Pilar 3)

### ❌ O que NÃO fazer:
* Colocar um som estridente de "WHOOSH" metálico ou "PING" a cada meio segundo em cada palavra.
* Usar efeitos em frequências agudas desconfortáveis (acima de 6kHz com volume alto).

### ✅ Como fazer no padrão profissional:
* **Sound Design Tátil e Minimalista**:
  * Usar SFX orgânicos: `click mecânico sutil`, `pop de bolha macio`, `folha de papel virando (paper slide)`, `tap de interface iOS`.
  * Volume calibrado entre **-14dB e -20dB** abaixo do áudio da voz principal.
  * Aplicar SFX somente nas transições principais de bloco e nas 4 ou 5 palavras vitais do vídeo.
