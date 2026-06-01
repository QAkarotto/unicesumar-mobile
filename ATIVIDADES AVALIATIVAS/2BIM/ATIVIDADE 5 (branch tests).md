# Atividade avaliativa 5 (1,0) - Desafios - Flutter / Movie App

## Data de entrega:
- ESOFT7S - 15/06
- ADSIS5S - 16/06

## 🔀 Usando a Branch da Aula

Esta atividade usa o código da branch **`tests`**. Se você estiver no fork, crie uma branch sua a partir dela para receber as atualizações da aula.

```bash
git fetch origin
git checkout tests
cd movies
flutter pub get
```

> Veja o [README](../../README.md) para o fluxo geral das atividades.

---

# movies

Projeto Flutter: atividade final da disciplina, criada do zero como desafio de consolidação dos conceitos vistos ao longo do curso.

Nesta proposta, você deve planejar e implementar um aplicativo Flutter de tema livre, por exemplo:

- controle financeiro
- catalogo de jogos
- rastreador de habitos
- ecommerce
- agenda
- qualquer outro tema aprovado pelo professor

**Material de apoio**: [MOVIES_GUIA.md](../MOVIES_GUIA.md)

---

## Objetivo

O foco desta atividade é aplicar, em um projeto novo, os principais conceitos estudados na reta final da disciplina, com separação de responsabilidades, acesso à API, persistência local e testes automatizados.

---

## Requisitos Técnicos

Seu aplicativo deve cumprir obrigatoriamente os itens abaixo.

### 1. Gestão de Estado

- Utilizar **Riverpod** para o gerenciamento de estado global.
- Organizar a solução de forma clara, com providers para as dependências principais.

### 2. Navegação Declarativa

- Utilizar **GoRouter** para o roteamento do aplicativo.
- Permitir passagem de parametros entre telas.
- Manter a navegação em conformidade com a estrutura do projeto.

### 3. Consumo de API Externa

- Integrar o aplicativo a uma API REST publica de sua escolha.
- Fazer o consumo de forma assíncrona com **Dio**.
- Modelar os dados JSON com geradores de codigo.

### 4. Persistência Local

- Utilizar **SharedPreferences** para salvar configurações simples do usuário, como tema, idioma ou filtros.
- Utilizar **SQLite** para salvar favoritos, histórico ou outros dados estruturados.

### 5. Arquitetura

- Aplicar **Arquitetura Limpa** com separação de responsabilidades.
- Organizar o projeto com **Repositories** e **Sources**.
- Evitar misturar regra de negócio com acesso a dados e UI.

### 6. Qualidade e Testes

Seu projeto deve conter, no mínimo:

- **5 testes de unidade** validando regras de negócio ou conversão de dados.
- **3 testes de widget** validando a renderização de componentes importantes.
- **1 teste de integração** validando um fluxo completo da aplicação.

---

## Tarefas

1. **Planejamento do app**
   - Defina o tema do aplicativo e quais telas ele terá.
   - Liste as regras de negócio principais.
   - Identifique quais dados serão salvos localmente e quais virão da API.

2. **Arquitetura e organização**
   - Separe a solução em camadas bem definidas.
   - Crie repositories, sources, models e viewmodels/providers.
   - Mantenha a responsabilidade de cada parte bem isolada.

3. **Funcionalidades principais**
   - Implemente o fluxo central da aplicação.
   - Crie telas de listagem, detalhe, configuração ou outras necessárias.
   - Garanta uma navegação consistente com GoRouter.

4. **Persistência e configurações**
   - Salve preferências simples com SharedPreferences.
   - Grave e consulte dados locais com SQLite.
   - Reabra o app e verifique se os dados continuam disponíveis.

5. **Testes obrigatórios**
   - Escreva testes unitários para regras e conversões.
   - Escreva testes de widget para componentes visuais importantes.
   - Escreva um teste de integração para um fluxo real do aplicativo.

---

## Sugestão de cobertura mínima dos testes

### Unit Tests

- conversão de JSON para model
- cálculo de valor, status, total ou filtro
- validação de regra de negócio
- ordenação ou agrupamento de dados
- função utilitária importante do domínio

### Widget Tests

- tela principal com estado inicial
- componente de formulário ou busca
- componente que alterna estados visuais

### Integration Test

- abrir o app
- navegar entre telas
- executar uma ação principal do fluxo
- confirmar que a experiência completa funciona

---

## Verificação

- [ ] Riverpod configurado e em uso
- [ ] GoRouter com parametros entre telas
- [ ] Consumo de API com Dio
- [ ] Persistencia com SharedPreferences
- [ ] Persistencia local com SQLite
- [ ] Arquitetura com separacao clara de responsabilidades
- [ ] 5 testes de unidade implementados
- [ ] 3 testes de widget implementados
- [ ] 1 teste de integracao implementado

---

## Documentação

- [Flutter Docs](https://flutter.dev/docs)
- [Riverpod](https://riverpod.dev/)
- [GoRouter](https://pub.dev/packages/go_router)
- [Dio](https://pub.dev/packages/dio)
- [SharedPreferences](https://pub.dev/packages/shared_preferences)
- [SQLite](https://pub.dev/packages/sqflite)

---

## Formato de Entrega

- Publicar em **repositório público no GitHub**.
- Enviar o link por e-mail para **joao.vsantos@unicesumar.edu.br**.
- Título do e-mail: **Trabalho 5 Mobile 2BIM - Turma: ESOFT7S/ADSIS5S**.
- Incluir no corpo do e-mail: nome dos integrantes, usuário GitHub e link do repositório.
- Colocar em **CC** o e-mail de todos os integrantes.
- Grupos de até **6 participantes**.
- Mostrar o código rodando e explicar as implementações realizadas.

---

**Planeje, implemente, teste e valide.**