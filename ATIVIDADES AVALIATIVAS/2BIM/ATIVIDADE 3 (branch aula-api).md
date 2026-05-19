# Atividade avaliativa 3 (1,0) - Desafios - Flutter / Movie App

## Data de entrega (próxima aula):
- ESOFT7S - 18/05 19h
- ADSIS5S - 19/05 19h

## 🔀 Usando a Branch da Aula

Esta atividade usa a branch **`aula-api`**. Se você estiver no fork, crie uma branch sua a partir dela para pegar as atualizações da aula.

```bash
git fetch origin
git checkout aula-api
cd app
flutter pub get
```

> Veja o [README](../../README.md) para o fluxo geral das atividades.

---
# movies

Projeto Flutter: versão evoluída do app de aula com integração de API real, Clean Architecture e Riverpod.

**Material de apoio**: [MOVIES_GUIA.md](../MOVIES_GUIA.md)

---

## Setup Inicial

### 1. Clonar e Dependências

```bash
git clone <url>
cd movies
flutter pub get
```

### 2. Configurar API (TheMovieDB)

1. Crie conta em https://www.themoviedb.org/settings/api
2. Gere chave API
3. Crie arquivo `.env` na raiz:
```
TMDB_KEY=sua_chave_aqui
```

---

## 3. Executar o Projeto

### 1️⃣ Localmente (Web)

```bash
flutter run -d chrome
```

Teste a app: navegue pelas telas, clique em filmes, verifique se os dados carregam.

### 2️⃣ Emulador Android

**Abrir Android Studio e criar emulador:**
1. Faça a instalação e configuração do Android Studio
2. Android Studio → Device Manager → Create Device
3. Escolha um dispositivo
4. Inicie o emulador

**Rodar no emulador:**
```bash
flutter devices          # Confirme que emulador aparece
flutter run
```

### 3️⃣ Celular via USB (Desafio)

**No celular:**
1. Configurações → Sobre → Número da compilação (toque 7x)
2. Volte, procure "Opções do desenvolvedor"
3. Ative: Depuração USB
4. Conecte via USB

**No computador:**
```bash
flutter devices          # Confirme que celular aparece
flutter run
```


---

### 4️⃣ Ler o [MOVIES_GUIA.md](../MOVIES_GUIA.md) para entender as mudanças no projeto.
---

## Documentação

- [Flutter Docs](https://flutter.dev/docs)
- [TheMovieDB API](https://www.themoviedb.org/settings/api)
- [Android Debug Bridge](https://developer.android.com/studio/command-line/adb)

## Formato de Entrega

- Publicar em **repositório público no GitHub**.
- Enviar o link por e-mail para **joao.vsantos@unicesumar.edu.br**.
- Título do e-mail: **Trabalho 3 Mobile 2BIM - Turma: ESOFT7S/ADSIS5S**.
- Incluir no corpo do e-mail: nome dos integrantes, usuário GitHub e link do repositório.
- Colocar em **CC** o e-mail de todos os integrantes.
- Grupos de até **6 participantes**.
