# Atividade avaliativa 4- Armazenamento local - Flutter / Movie App

## Data de entrega (proxima aula):
- ESOFT7S - 01/06 19h
- ADSIS5S - 02/06 19h

## Usando a Branch da Aula

Esta atividade usa a branch **`aula_armazenamento`**. Se voce estiver no fork, crie uma branch sua a partir dela para pegar as atualizacoes da aula.

```bash
git fetch origin
git checkout aula_armazenamento
cd movies
flutter pub get
```

> Veja o [README](../../README.md) para o fluxo geral das atividades.

---
# movies

Projeto Flutter: versao evoluida do app de aula com armazenamento local em dois niveis.

- SharedPreferences para dados simples.
- SQLite com Drift para persistencia relacional.

**Material de apoio**: [MOVIES_GUIA.md](../MOVIES_GUIA.md)

---

## Tarefas

1. **Tema claro com selecao de tema**
   - O app ja inicia em tema escuro; a tarefa e implementar o tema claro e oferecer ao usuario a opcao de selecionar entre claro e escuro.
   - Salvar a preferencia com SharedPreferences.
   - Restaurar a escolha ao reabrir o aplicativo.
   - Dica: veja [movies/lib/main.dart](../../movies/lib/main.dart) e [movies/lib/ui/theme/theme.dart](../../movies/lib/ui/theme/theme.dart).

2. **SharedPreferences**
   - Guardar e restaurar o ultimo termo de busca na tela de generos.
   - Guardar e restaurar o ultimo criterio de ordenacao escolhido.
   - Ao abrir a tela de generos, restaurar os valores salvos.
   - Ao mudar a busca ou ordenacao, salvar o novo valor.
   - Dica: veja [movies/lib/ui/screens/genres/genre_screen.dart](../../movies/lib/ui/screens/genres/genre_screen.dart), [movies/lib/providers.dart](../../movies/lib/providers.dart) e [movies/lib/utils/prefs.dart](../../movies/lib/utils/prefs.dart).

3. **SQLite/Drift**
   - Salvar filmes favoritados no banco local.
   - Listar favoritos a partir do banco local.
   - Remover favoritos do banco local.
   - Ajustar o fluxo para que a tela de favoritos leia do banco.
   - Garantir que ao desfavoritar o item seja removido do banco.
   - Dica: veja [movies/lib/data/database/](../../movies/lib/data/database/), [movies/lib/ui/movie_viewmodel.dart](../../movies/lib/ui/movie_viewmodel.dart), [movies/lib/ui/screens/movie_detail/movie_detail.dart](../../movies/lib/ui/screens/movie_detail/movie_detail.dart) e [movies/lib/ui/screens/favorites/favorite_screen.dart](../../movies/lib/ui/screens/favorites/favorite_screen.dart).

4. **Validacao**
   - Reabrir o app e verificar que o tema, as preferencias e os favoritos foram restaurados.
   - Alterar o tema, a busca e a ordenacao para confirmar que tudo fica salvo.
   - Favoritar, fechar o app e confirmar que os dados continuam persistidos.

---

## Documentacao

- [Flutter Docs](https://flutter.dev/docs)
- [SharedPreferences](https://pub.dev/packages/shared_preferences)
- [Drift](https://drift.simonbinder.eu/)

## Formato de Entrega

- Publicar em **repositorio publico no GitHub**.
- Enviar o link por e-mail para **joao.vsantos@unicesumar.edu.br**.
- Titulo do e-mail: **Trabalho 4 Mobile 2BIM - Turma: ESOFT7S/ADSIS5S**.
- Incluir no corpo do e-mail: nome dos integrantes, usuario GitHub e link do repositorio.
- Colocar em **CC** o e-mail de todos os integrantes.
- Grupos de ate **6 participantes**.