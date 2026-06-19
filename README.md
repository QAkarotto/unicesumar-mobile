# Programação para Dispositivos Móveis - Unicesumar Ponta Grossa

Repositório com materiais das aulas práticas de Dart e Flutter, atividades avaliativas e projetos usados como base para a disciplina.

## Estrutura

- [ATIVIDADES AVALIATIVAS/1BIM](ATIVIDADES%20AVALIATIVAS/1BIM) - atividades avaliativas da primeira etapa.
- [ATIVIDADES AVALIATIVAS/2BIM](ATIVIDADES%20AVALIATIVAS/2BIM) - atividades avaliativas da segunda etapa, com branches específicas por aula.
- [movies](movies) - projeto Flutter principal usado nas aulas mais recentes, com API, navegação, persistência e testes.
- [Chapter 12/movies](Chapter%2012/movies) - versão de apoio do projeto Movies.
- [MOVIES_GUIA.md](MOVIES_GUIA.md) - guia complementar sobre a evolução arquitetural do app Movies.

## Atividades Avaliativas - 1BIM

As descrições completas das atividades da primeira etapa estão na pasta [ATIVIDADES AVALIATIVAS/1BIM](ATIVIDADES%20AVALIATIVAS/1BIM):

- [Atividade Avaliativa 1](ATIVIDADES%20AVALIATIVAS/1BIM/ATIVIDADE_AVALIATIVA_1.md)
- [Atividade Avaliativa 2](ATIVIDADES%20AVALIATIVAS/1BIM/ATIVIDADE_AVALIATIVA_2.md)
- [Atividade Avaliativa 3](ATIVIDADES%20AVALIATIVAS/1BIM/ATIVIDADE_AVALIATIVA_3.md)
- [Atividade Avaliativa 4](ATIVIDADES%20AVALIATIVAS/1BIM/ATIVIDADE_AVALIATIVA_4.md)

## Atividades Avaliativas - 2BIM

Cada atividade usa a branch indicada no título do arquivo. Se você estiver trabalhando em um fork, crie uma branch própria a partir da branch da aula para receber as atualizações.

- [Atividade 1 - ListView, GridView e interação com itens](ATIVIDADES%20AVALIATIVAS/2BIM/ATIVIDADE%201%20%28branch%20aula-list-grid-view%29.md) - `aula-list-grid-view`
- [Atividade 2 - Navegação e roteamento com AutoRoute](ATIVIDADES%20AVALIATIVAS/2BIM/ATIVIDADE%202%20%28branch%20aula-navigator-router%29.md) - `aula-navigator-router`
- [Atividade 3 - API, Clean Architecture e Riverpod](ATIVIDADES%20AVALIATIVAS/2BIM/ATIVIDADE%203%20%28branch%20aula-api%29.md) - `aula-api`
- [Atividade 4 - Armazenamento local com SharedPreferences e Drift](ATIVIDADES%20AVALIATIVAS/2BIM/ATIVIDADE%204%20%28branch%20aula_armazenamento%29.md) - `aula_armazenamento`
- [Atividade 5 - Projeto final, arquitetura, persistência e testes](ATIVIDADES%20AVALIATIVAS/2BIM/ATIVIDADE%205%20%28branch%20tests%29.md) - `tests`

## Fluxo geral das atividades

1. Busque as branches remotas:

```bash
git fetch origin
```

2. Entre na branch indicada pela atividade:

```bash
git checkout nome-da-branch
```

3. Acesse a pasta do projeto Flutter correspondente e instale as dependências:

```bash
cd movies
flutter pub get
```

4. Rode o app ou os testes conforme a proposta da atividade.

> Algumas atividades antigas podem citar `cd app` porque foram criadas a partir de uma estrutura anterior. Nas atividades mais recentes, o projeto principal está em `movies`.

## Projeto Movies

O projeto [movies](movies) concentra os exemplos mais recentes da disciplina:

- consumo de API externa com Dio;
- gerenciamento de estado com Riverpod;
- navegação declarativa;
- modelos e organização em camadas;
- persistência local com SharedPreferences e SQLite/Drift;
- testes de unidade, widget e integração.

Material de apoio: [MOVIES_GUIA.md](MOVIES_GUIA.md).

### Executar o app

```bash
cd movies
flutter pub get
flutter run
```

Para executar no navegador:

```bash
cd movies
flutter run -d chrome
```

### Testes

Na pasta `movies/`, há exemplos de testes de unidade, widget e integração.

```bash
cd movies
flutter test
flutter test test/utils_test.dart
flutter test integration_test/app_test.dart
```

Observações:

- Os testes de integração precisam de emulador ou dispositivo conectado.
- Os exemplos foram pensados para validar regras, widgets e fluxos principais sem depender de persistência real.

## Mapa Mental

- **Link:** [Mapa Mental da Disciplina](https://app.xmind.com/share/J36p6d0F)

## Observação

Este repositório é didático e prioriza exemplos pequenos, exercícios guiados e evolução incremental.
