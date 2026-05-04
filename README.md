# Trilha Flutter

Esta pasta concentra os projetos Flutter desenvolvidos durante a disciplina.

## Objetivo da Trilha

Aplicar os conceitos de Dart na construção de interfaces e fluxos de aplicações móveis, com foco em:

- Estrutura de projetos Flutter
- Widgets, layouts e componentização
- Estado e composição de telas
- Boas práticas de organização

## Estrutura

```text
flutter/
  app/
    lib/          # aplicação principal
    docs/         # roteiros de aula
    test/         # testes de widget/unidade
    aula_widget/  # projeto dedicado a widgets e layouts
```

## Projeto Principal

Local: `flutter/app`

```bash
cd flutter/app
flutter pub get
flutter run
flutter test
```

## Projeto Complementar de Widgets

Local: `flutter/app/aula_widget`

```bash
cd flutter/app/aula_widget
flutter pub get
flutter run
flutter test
```

## Fluxo Recomendado em Aula

1. Abra o roteiro em `app/docs/`.
2. Execute o projeto correspondente ao tema da aula.
3. Replique o exemplo e implemente variações.
4. Versione a evolução do código por aula.

## Dicas Rápidas

- Verifique dispositivos com `flutter devices`.
- Execute `flutter doctor` ao preparar o ambiente.
- Evite commitar artefatos de build e caches locais.
