# Roteiro de Aula: Widgets, Layouts e Componentizacao (Flutter)

## Objetivo da aula
Ao final da aula, os alunos devem conseguir:
- Entender o que e um widget no Flutter.
- Organizar widgets com Column e Row.
- Aplicar responsividade basica com Expanded e flex.
- Criar e reutilizar componente com StatelessWidget.
- Entender quando usar StatefulWidget e setState.

## Tempo sugerido (50-70 min)
1. Abertura e contexto (5 min)
2. Passo 1 - Widget basico (8 min)
3. Passo 2 - Layouts com Column e Row (10 min)
4. Passo 3 - Responsividade com Expanded/flex (12 min)
5. Passo 4 - Componentizacao com CustomCard (12 min)
6. Passo 5 - Uso do componente + revisao (10 min)
7. Perguntas e fechamento (5-10 min)

## Arquivos de apoio
- Passo 1: lib/aula_progressiva/main_passo_01_widgets_basicos.dart
- Passo 2: lib/aula_progressiva/main_passo_02_layouts_agrupamento.dart
- Passo 3: lib/aula_progressiva/main_passo_03_responsividade.dart
- Passo 4: lib/aula_progressiva/main_passo_04_componentizacao.dart
- Passo 5: lib/aula_progressiva/main_passo_05_app_completo.dart
- Versao consolidada: lib/main.dart

## Roteiro por etapa

### 1) Abertura
Fala sugerida:
- "Hoje vamos construir uma tela Flutter de forma progressiva."
- "A ideia e sair de um Text simples e chegar em um app organizado e reutilizavel."
- "Tambem vamos usar StatefulWidget para ver alteracoes em tempo real com setState."

### 2) Passo 1 - Widget basico
Conceitos:
- Tudo e widget no Flutter.
- Estrutura minima: MaterialApp -> Scaffold -> Center -> Text.
- StatefulWidget e setState para atualizar interface.

Demo ao vivo:
- Mostrar o texto centralizado.
- Clicar no botao flutuante para alternar a cor do texto.

Fala sugerida:
- "Mesmo um texto simples ja e um widget."
- "Quando eu clico no botao, setState avisa o Flutter para reconstruir a tela."

### 3) Passo 2 - Layouts de agrupamento
Conceitos:
- Column organiza no eixo vertical.
- Row organiza no eixo horizontal.
- mainAxisAlignment e crossAxisAlignment.

Demo ao vivo:
- Mostrar alinhamento da Column.
- Clicar no botao flutuante para alternar o alinhamento vertical.

Fala sugerida:
- "mainAxis e o eixo principal do widget."
- "Na Column, mainAxis e vertical. Na Row, mainAxis e horizontal."

### 4) Passo 3 - Responsividade
Conceitos:
- Expanded ocupa espaco restante.
- flex define proporcao de ocupacao.
- Comparar blocos fluidos (Expanded) x bloco fixo (width).

Demo ao vivo:
- Clicar no botao para inverter flex 2:1 para 1:2.
- Perguntar para turma: "qual bloco deve crescer mais agora?"

Fala sugerida:
- "Com flex, a tela se adapta melhor a diferentes larguras."
- "Isso e uma base importante para responsividade em Flutter."

### 5) Passo 4 - Componentizacao
Conceitos:
- Evitar repeticao criando componente proprio.
- CustomCard recebe dados por construtor (titulo, icone, corFundo).
- Separacao de responsabilidades.

Demo ao vivo:
- Mostrar classe CustomCard no final do arquivo.
- Alterar borda/sombra para mostrar que todas instancias herdarao o estilo.

Fala sugerida:
- "Componente e um molde visual reutilizavel."
- "Mudou no componente, muda em todos os lugares onde ele e usado."

### 6) Passo 5 - Uso do componente
Conceitos:
- Reuso com diferentes dados.
- Codigo mais limpo e facil de manter.
- Relacao entre composicao e escalabilidade de UI.

Demo ao vivo:
- Trocar icone e cor de um CustomCard.
- Mostrar que so os parametros mudam, nao a estrutura do card.

Fala sugerida:
- "Agora temos a mesma estrutura para varios itens, sem copiar e colar layout."

## Perguntas provaveis e respostas

1. "Quando usar StatelessWidget e quando usar StatefulWidget?"
- Use StatelessWidget quando a UI nao depende de estado que muda localmente.
- Use StatefulWidget quando a propria tela precisa mudar em tempo real com interacao.

2. "setState refaz a tela toda?"
- Ele dispara novo build do widget de estado atual e seus filhos.
- Flutter otimiza a renderizacao para atualizar apenas o necessario.

3. "Por que usar const?"
- const ajuda performance e deixa a intencao clara: aquele widget nao muda.

4. "Qual diferenca entre Row e Column?"
- Row: organiza filhos na horizontal.
- Column: organiza filhos na vertical.

5. "Para que serve Expanded?"
- Para dividir o espaco restante de forma proporcional no eixo principal.

6. "O que e flex?"
- E o peso relativo na divisao de espaco entre widgets Expanded.

7. "Por que criar CustomCard em vez de repetir Containers?"
- Reuso, manutencao simples, menos chance de erro e codigo mais legivel.

8. "Se eu precisar muitos cards dinamicos, o que fazer?"
- Usar lista de dados + ListView.builder para gerar cards automaticamente.

9. "Tem problema usar muito setState?"
- Em telas pequenas e simples, nao.
- Em apps maiores, voce pode evoluir para gerencia de estado dedicada.

10. "Posso usar essa base em app real?"
- Sim. Essa estrutura e uma boa base didatica e pode evoluir para projetos maiores.

## Checklist final da aula
- Demonstrou mudanca visual com setState.
- Explicou eixos de Row e Column.
- Explicou Expanded e flex com exemplo pratico.
- Criou e reutilizou CustomCard.
- Mostrou ganho de organizacao e manutencao.

## Atividade de fixacao (10 min)
Peça para os alunos:
1. Adicionar um quarto CustomCard com outro icone.
2. Alterar o flex para 3:1 e observar o comportamento.
3. Trocar o alinhamento da Column e explicar o resultado.
4. Alterar o estilo do CustomCard (cor, raio, sombra) e validar o reuso.
