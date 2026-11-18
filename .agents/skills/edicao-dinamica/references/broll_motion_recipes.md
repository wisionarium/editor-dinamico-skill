# Receitas de Animação e B-Rolls Dinâmicos

Guia prático de implementação das 6 principais técnicas de cena e B-Rolls identificadas nos estilos de alta conversão.

---

## 1. O Canvas Flutuante com Fundo de Luxo (Estilos 1 e 2)

### Descrição Visual:
O vídeo principal não fica esticado até a borda crua da tela. Ele é renderizado como um cartão com cantos arredondados, repousando sobre um fundo quente com sombra suave de folhagem/luz ambiente.

### Especificações Técnicas:
* **Canvas Total**: 1080 x 1920 px (9:16 vertical).
* **Fundo (Background)**:
  * Gradiente ou cor sólida areia/bege suave (`#D8CBBF` a `#EAE3DB`).
  * Camada de sombra botânica sutil (overlay de folha com opacidade 15-20% e desfoque suave).
* **Quadro de Vídeo Principal**:
  * Largura: 880px a 940px | Altura: 1564px a 1670px (mantendo proporção 9:16).
  * Cantos Arredondados: Raio de curvatura entre `24px` e `32px`.
  * Sombra Projetada (Drop Shadow): `0px 20px 40px rgba(0, 0, 0, 0.25)`.
* **Badge Superior (Pílula 'EDITADO')**:
  * Posição: 20px acima da borda superior do card ou flutuando no topo.
  * Formato: Pílula preta sólida com cantos arredondados totais (`border-radius: 999px`).
  * Tipografia: Sans-serif bold, caixa alta, branco puro, kerning estendido (`EDITADO`).

---

## 2. A Tela Editorial com Grid Arquitetônico (Estilos 1 e 2)

### Descrição Visual:
Uma interrupção visual de 1 a 2 segundos com estética de revista de design ou catálogo de luxo. Utilizada para fixar uma tese importante (ex: *"Tudo sozinho"*, *"Elas VENDEM significado!"*, *"é só o músculo!"*).

### Especificações Técnicas:
* **Fundo**: Branco puro (`#FFFFFF`) ou Off-White quente (`#F5F3EF`).
* **Grid Gráfico**:
  * Linhas finas de 1px em cinza muito claro (`rgba(0,0,0,0.08)`).
  * Padrão de regra dos terços ou grid 4x4.
  * Marcações tipográficas mínimas nas bordas (ex: `UNFOLD 2010TX`, números de série técnicos em tamanho 10pt).
* **Animação do Texto Central**:
  * Entrada: Escala suave de 92% para 100% combinada com fade in de 8 frames (0.25s).
  * Tipografia mista: Uma linha em sans-serif minimalista e a palavra principal em serifada bold ou caixa alta expressiva.
  * Traço ou riscado: Linha fina vermelha ou preta traçada dinamicamente sob a palavra de fechamento.

---

## 3. Split Screen Dinâmico (50/50 Horizontal) (Estilo 2)

### Descrição Visual:
A tela é dividida ao meio na horizontal.
* **Metade Superior (50%)**: B-roll cinematográfico de ação ou contexto (ex: atendimento clínico, produto em uso, tela de dados).
* **Metade Inferior (50%)**: Apresentador continuando a falar.
* **A Linha de Divisão**: Linha preta sutil de 2px a 3px com bordas nítidas.

### Quando Usar:
* Quando o apresentador cita exemplos práticos ("muita gente cuida da dor... outros cuidam do exercício...").
* Transição de B-Rolls: Enquanto a parte de baixo se mantém fixa gerando conexão com o locutor, a parte de cima pode trocar de clipe a cada 1.2 segundos para demonstrar variedade e ritmo.

---

## 4. O Impacto Monocromático (Dramatic B&W Zoom) (Estilo 2)

### Descrição Visual:
Em momentos de virada dramática, revelação de um erro comum ou afirmação definitiva (ex: *"não é falta de força... é falta de base"*):
* A saturação do vídeo do apresentador cai para 0% (Preto e Branco puro com alto contraste).
* Um punch-in zoom rápido de 115% a 125% é acionado no rosto/olhar do apresentador.
* O enquadramento ganha uma máscara com cantos arredondados e vinheta escura suave.
* O corte para o P&B dura entre 1.5s e 2.5s, retornando ao colorido natural no próximo corte de afirmação positiva.

---

## 5. Cards de UI Translúcidos (Glassmorphism Minimalista) (Estilo 1 e 2)

### Descrição Visual:
Elementos gráficos que representam tópicos, pilares ou categorias (ex: `TEMPO`, `PRESTÍGIO`, `LEGADO` ou `Winner`, `Saúde`, `Ciência`).

### Especificações Técnicas:
* **Material**: Fundo escuro ou claro translúcido (`rgba(255, 255, 255, 0.08)` sobre fundo escuro ou `rgba(0, 0, 0, 0.6)` sobre fundo claro) com desfoque de fundo (*backdrop blur* de 15px).
* **Borda**: Linha de 1px com degradê sutil simulando reflexo de vidro (`rgba(255, 255, 255, 0.2)`).
* **Ícone e Texto**: Ícone minimalista monocromático no topo e título em tipografia geométrica bold abaixo.
* **Animação**: Entrada em cascata (Stagger animation). Cada card entra com 0.15s de delay em relação ao anterior, subindo 30px com easing `cubic-bezier(0.16, 1, 0.3, 1)`.
* **Sound Design**: Cada card que surge emite um `pop` tátil de baixa frequência.

---

## 6. O B-Roll Triplo / Triptych (Estilo 1)

### Descrição Visual:
A tela é dividida em 3 faixas horizontais iguais (33.3% de altura cada), todas exibindo o mesmo B-Roll ou ângulos complementares em câmera lenta sincronizada.
* Excelente para momentos de moda, lifestyle, estética e movimento esportivo.
* Aumenta a percepção de sofisticação e cinematografia em vídeos corporativos e comerciais.
