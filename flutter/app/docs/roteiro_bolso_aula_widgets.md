# Roteiro de Bolso - Aula Flutter

Tema: Widgets, Layouts e Componentizacao
Duracao sugerida: 40-60 min

## 1) Abertura (2 min)
Fala curta:
- Hoje vamos construir uma tela Flutter por etapas.
- Vamos sair de um Text simples e chegar em componentes reutilizaveis.
- Tambem veremos StatefulWidget e setState para atualizar a UI em tempo real.

## 2) Passo 1 - Widget basico (5-8 min)
Arquivo: lib/aula_progressiva/main_passo_01_widgets_basicos.dart

Objetivo:
- Mostrar que tudo em Flutter e widget.

Pontos de fala:
- MaterialApp e o container principal do app.
- Scaffold e a estrutura visual da tela.
- Center + Text = exemplo minimo.
- StatefulWidget + setState para mudar a cor do texto.

Demo:
- Clique no FloatingActionButton e mostre a mudanca de cor.

## 3) Passo 2 - Column e Row (8-10 min)
Arquivo: lib/aula_progressiva/main_passo_02_layouts_agrupamento.dart

Objetivo:
- Entender organizacao vertical e horizontal.

Pontos de fala:
- Column organiza no eixo vertical.
- Row organiza no eixo horizontal.
- mainAxisAlignment e crossAxisAlignment.

Demo:
- Use o botao para alternar alinhamento da Column.

## 4) Passo 3 - Responsividade (10-12 min)
Arquivo: lib/aula_progressiva/main_passo_03_responsividade.dart

Objetivo:
- Mostrar divisao proporcional de espaco com Expanded e flex.

Pontos de fala:
- Expanded ocupa espaco restante.
- flex e proporcao (2:1, 1:2).
- Container com largura fixa vs largura flexivel.

Demo:
- Botao inverte flex e evidencia mudanca visual.

## 5) Passo 4 - Componentizacao (8-10 min)
Arquivo: lib/aula_progressiva/main_passo_04_componentizacao.dart

Objetivo:
- Criar um componente reutilizavel (CustomCard).

Pontos de fala:
- Evitar repeticao de codigo.
- Parametros obrigatorios no construtor.
- Estilo centralizado em um unico lugar.

Demo:
- Mude borda/sombra/icone no CustomCard e mostre impacto.

## 6) Passo 5 - Uso do componente (8-10 min)
Arquivo: lib/aula_progressiva/main_passo_05_app_completo.dart

Objetivo:
- Reutilizar o componente com dados diferentes.

Pontos de fala:
- Mesmo layout, dados diferentes.
- Codigo mais limpo, facil manutencao.
- Base para evoluir para listas dinamicas.

Demo:
- Altere titulo/cor/icone de um card ao vivo.

## 7) Fechamento (3-5 min)
Resumo para falar:
- Aprendemos estrutura de tela, layout, responsividade e reuso.
- Entendemos quando usar StatefulWidget e setState.
- Essa base ja permite construir interfaces reais simples.

## Perguntas provaveis + resposta curta
1. Quando usar StatelessWidget?
- Quando nao ha estado local mudando na tela.

2. Quando usar StatefulWidget?
- Quando a tela precisa reagir a interacao e atualizar UI com setState.

3. setState recria tudo?
- Reexecuta build do widget de estado; Flutter otimiza a renderizacao.

4. Para que serve const?
- Melhora performance e deixa claro o que nao muda.

5. Qual diferenca entre Row e Column?
- Row: horizontal. Column: vertical.

6. Para que serve Expanded?
- Divide o espaco restante no eixo principal.

7. O que e flex?
- O peso de cada Expanded na divisao proporcional.

8. Por que componentizar?
- Reuso, manutencao simples e menos duplicacao.

## Checklist rapido antes da aula
- App executando com Hot Reload.
- Arquivos dos passos abertos em abas.
- Botao de cada passo funcionando.
- Plano de tempo visivel para nao estourar.
