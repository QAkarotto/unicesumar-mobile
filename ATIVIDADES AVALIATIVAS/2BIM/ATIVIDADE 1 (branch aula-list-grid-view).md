# Atividade avaliativa 1 (1,0) -  Desafios - Flutter / Movie App

## Data de entrega (próxima aula): 
- ESOFT7S - 04/05
- ADSIS5S - 05/05

## 🔀 Usando a Branch da Aula

Esta atividade usa o código da branch **`aula-list-grid-view`**. Para obter o código:

```bash
git fetch origin
git checkout aula-list-grid-view
cd app
flutter pub get
```

Se você estiver no fork, crie uma branch sua a partir desta branch da aula.

> Veja o [README](../../README.md) para o fluxo geral das atividades.

---

Este arquivo apresenta desafios que partem de um código base já pronto. A proposta é que os estudantes leiam a implementação atual, estudem o conteúdo visto em sala, consultem a documentação e pesquisem soluções para evoluir o código aos poucos.

## Desafio 1

Este código pode apresentar problemas de desempenho com listas muito grandes. Reflita sobre como os itens estão sendo renderizados. Existe uma forma mais eficiente de construir listas no Flutter sob demanda?

**Onde olhar no código**

- [flutter/app/lib/widgets/filmes_listview.dart](../../flutter/app/lib/widgets/filmes_listview.dart)

## Desafio 2

Atualmente os itens não possuem nenhuma interação. Implemente um comportamento ao toque do usuário. Dica: o usuário deve receber algum tipo de feedback visual, não apenas print no console.

**Onde olhar no código**

- [flutter/app/lib/widgets/filmes_listview.dart](../../flutter/app/lib/widgets/filmes_listview.dart)
- [flutter/app/lib/main.dart](../../flutter/app/lib/main.dart)
- Trecho: os cards de filme estão sem `onTap` e a tela principal ainda não oferece feedback visual para ações do usuário.

## Observação didática

Os desafios foram deixados de propósito em um ponto de partida simples e com limitações. A ideia é que o estudante leia o código, identifique a decisão técnica e proponha uma melhoria depois.

## Formato de Entrega

O formato de entrega segue o mesmo padrão das atividades anteriores:

- Publicar em **repositório público no GitHub**.
- Enviar o link por e-mail para **joao.vsantos@unicesumar.edu.br**.
- Título do e-mail: **Trabalho 1 Mobile 2BIM - Turma: ESOFT7S/ADSIS5S**.
- Incluir no corpo do e-mail: nome dos integrantes, usuário GitHub e link do repositório.
- Colocar em **CC** o e-mail de todos os integrantes.
- Grupos de até **6 participantes**.
- Mostrar o código rodando e explicar as implementações realizadas (mostrar em sala ou gravar um vídeo).
