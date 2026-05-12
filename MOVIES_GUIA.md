# 📱 Guia: Evoluindo para a Nova Versão do App

> Material complementar para entender as diferenças arquiteturais e de implementação da versão evoluída do app que utilizaremos daqui em diante.

---

## 📋 Índice Rápido

1. [Visão Geral](#visão-geral)
2. [Estrutura de Pastas](#estrutura-de-pastas)
3. [Dependências Novas](#dependências-novas)
4. [Principais Diferenças](#principais-diferenças)
5. [Conceitos Novos](#conceitos-novos)
6. [Próximos Passos](#próximos-passos)

---

## Visão Geral

Ao longo do semestre evoluímos o app das aulas. Passamos de:

- ❌ **Antes**: Dados estáticos em JSON local, estrutura simples
- ✅ **Agora**: Integração com API real, arquitetura profissional, pronto para produção

Esta nova versão mantém os mesmos conceitos que aprendemos, mas os organiza de forma mais escalável usando **Clean Architecture**.

### Estrutura em Camadas

```
┌──────────────────────────────────┐
│   UI LAYER                       │ ← Telas e componentes visuais
│   (screens, widgets)             │
└────────────────┬─────────────────┘
                 │ observa via ref.watch()
                 ▼
┌──────────────────────────────────┐
│   BUSINESS LOGIC LAYER           │ ← Gerenciamento de estado
│   (viewmodel, providers)         │   e lógica de negócio
└────────────────┬─────────────────┘
                 │ utiliza
                 ▼
┌──────────────────────────────────┐
│   DATA LAYER                     │ ← Requisições HTTP
│   (api_service)                  │   e modelos de dados
└────────────────┬─────────────────┘
                 │ HTTP request
                 ▼
            ☁️  API External
```

---

## Estrutura de Pastas

### Antes (app)
```
lib/
  ├── main.dart           
  ├── models/             (modelos simples)
  └── widgets/            (componentes)
```

### Agora (movies)
```
lib/
  ├── main.dart                          (entry point)
  ├── providers.dart                     (gerenciamento de estado)
  │
  ├── data/                              ← CAMADA DE DADOS
  │   └── models/                        (estruturas de dados)
  │
  ├── network/                           ← CAMADA DE REDE
  │   └── movie_api_service.dart         (requisições HTTP)
  │
  ├── ui/                                ← CAMADA DE APRESENTAÇÃO
  │   ├── screens/                       (telas da app)
  │   ├── widgets/                       (componentes reutilizáveis)
  │   ├── movie_viewmodel.dart           (lógica de UI)
  │   └── theme/                         (tema da aplicação)
  │
  └── router/                            ← CAMADA DE NAVEGAÇÃO
      └── app_routes.dart                (rotas - AutoRoute)
```

**Por que separar assim?**

Cada camada tem uma responsabilidade clara:
- **Data**: Modelos de dados
- **Network**: Comunicação com servidor
- **UI**: Interface com usuário
- **Router**: Navegação entre telas

Isso facilita manutenção e testes.

---

## Dependências Novas

### Roteamento
```yaml
auto_route: ^8.2.0
```
Você já implementou rotas com AutoRoute na aula de navegação. Aqui usamos o mesmo conceito.

### Estado Avançado
```yaml
flutter_riverpod: ^2.5.1
riverpod_annotation: ^2.3.5
```
Riverpod agora com anotações (gera código automaticamente).

### HTTP Client
```yaml
dio:  # via pubspec.lock
```
Cliente HTTP profissional com interceptadores (tratamento automático de erros, timeouts, etc).

### Modelos Imutáveis
```yaml
json_annotation: ^4.8.1
```
Gera serialização JSON automaticamente.

### UI Avançada
```yaml
cached_network_image: ^3.3.1
flutter_animate: ^4.5.0
```
Cache de imagens e animações fluidas.

### Configuração
```yaml
flutter_dotenv: # para variáveis de ambiente (.env)
```
Segurança: chaves de API não hardcoded no código.

---

## Principais Diferenças

### 1. Dados: JSON Local → API Rest

**Antes:**
```dart
// Arquivo estático assets/filmes.json
Future<List<FilmeItem>> carregarFilmes() async {
  final jsonString = await rootBundle.loadString('assets/data/filmes.json');
  return jsonData.map((filme) => FilmeItem.fromJson(filme)).toList();
}
```

**Agora:**
```dart
// API real via HTTP
Future<MovieResponse> getPopularMovies(int page) async {
  final response = await dio.get(
    'movie/popular',
    queryParameters: {'page': page},
  );
  return MovieResponse.fromJson(response.data);
}
```

**Conceitos**: Requisição HTTP assincronizada, tratamento de erros de rede, timeouts configuráveis.

---

### 2. Inicialização: Dados Passados → Providers Globais

**Antes:**
```dart
Future<void> main() async {
  final List<FilmeItem> filmes = await carregarFilmes();
  runApp(MainApp(filmes: filmes));  // Dados passados por construtor
}
```

**Agora:**
```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');  // Carrega variáveis de ambiente
  
  runApp(const ProviderScope(child: MainApp()));  // Providers globais
}
```

**Conceitos**: Providers gerenciam estado globalmente, dados são carregados sob demanda, não na inicialização.

---

### 3. Consumo de Dados: Construtor → ref.watch()

**Antes:**
```dart
class FilmesListView extends StatelessWidget {
  final List<FilmeItem> filmes;  // Dados passados
  
  const FilmesListView({required this.filmes});
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filmes.length,
      itemBuilder: (context, index) => FilmeTile(filmes[index]),
    );
  }
}
```

**Agora:**
```dart
class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Observa dados do provider - atualiza automaticamente quando mudam
    final asyncMovies = ref.watch(movieViewModelProvider);

    return asyncMovies.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, _) => Text('Erro: $error'),
      data: (viewModel) => ListView.builder(
        itemCount: viewModel.movies.length,
        itemBuilder: (context, index) => MovieTile(viewModel.movies[index]),
      ),
    );
  }
}
```

**Conceitos**: 
- `ConsumerWidget` para acessar Riverpod
- `ref.watch()` observa mudanças automáticas
- `.when()` trata 3 estados: loading, error, data
- UI reativa (atualiza quando dados mudam)

---

### 4. Navegação: Navigator.push() → AutoRoute

Você já implementou `AutoRoute` na aula de navegação. Aqui usamos o mesmo:

**Definir rotas:**
```dart
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', initial: true, page: MainRoute.page, children: [
      AutoRoute(path: 'home', page: HomeRoute.page),
      AutoRoute(path: 'favorites', page: FavoriteRoute.page),
    ]),
    CustomRoute(
      path: '/details/:movieId',
      page: MovieDetailRoute.page,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      durationInMilliseconds: 500,
    ),
  ];
}
```

**Navegar:**
```dart
// Tipo-seguro (IDE auto-completa)
context.router.push(MovieDetailRoute(movieId: movie.movieId));
```

---

### 5. Modelos: Manual → Geração de Código

**Antes:**
```dart
class FilmeItem {
  const FilmeItem({required this.titulo, required this.imageUrl});
  
  final String titulo;
  final String imageUrl;
  
  factory FilmeItem.fromJson(Map<String, dynamic> json) {
    return FilmeItem(
      titulo: json['titulo'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }
}
```

**Agora:**
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';  // ⚙️ Gerado automaticamente
part 'movie.g.dart';         // ⚙️ Gerado automaticamente

@freezed
class Movie with _$Movie {
  const factory Movie({
    @JsonKey(name: 'id') required int movieId,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'poster_path') required String image,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => 
    _$MovieFromJson(json);
}
```

**O que ganha de graça:**
- ✅ `fromJson()` e `toJson()` automáticos
- ✅ `copyWith()` para imutabilidade
- ✅ `==` e `hashCode` para comparação
- ✅ `toString()` melhorado

**Conceito**: Imutabilidade com `freezed` evita bugs de estado compartilhado.

---

### 6. Providers: Simples → Com Anotações

**Antes:**
```dart
final filmesProvider = Provider<List<FilmeItem>>((ref) {
  return [FilmeItem(...), FilmeItem(...)];
});
```

**Agora:**
```dart
// providers.dart - com anotações
@Riverpod(keepAlive: true)
MovieAPIService movieAPIService(MovieAPIServiceRef ref) {
  return MovieAPIService();
}

@Riverpod(keepAlive: true)
Future<MovieViewModel> movieViewModel(MovieViewModelRef ref) async {
  final model = MovieViewModel(
    movieAPIService: ref.read(movieAPIServiceProvider)
  );
  await model.setup();  // Carrega dados da API
  return model;
}

// ⚙️ IMPORTANTE: Depois de editar, rodar:
// dart run build_runner build --delete-conflicting-outputs
```

**Conceitos**:
- `@Riverpod` gera provider automaticamente
- `keepAlive: true` = dados mantidos em cache
- `Future<T>` = operação assincronizada
- Providers tipados (type-safe)

---

### 7. Segurança: Hardcoded → Variáveis de Ambiente

**Antes:** API key hardcoded (perigoso!)
```dart
const String apiKey = 'sk_test_abc123...';  // ❌ NUNCA ASSIM!
```

**Agora:** Arquivo `.env` (não versionado)
```env
TMDB_KEY=sua_chave_aqui
```

```dart
final String apiKey = dotenv.env['TMDB_KEY'] ?? '';  // ✅ Seguro
```

**.gitignore** já ignora `.env`:
```
.env          # Nunca fazer commit de chaves!
```

---

## Principais Conceitos Novos

### APIs e HTTP

A app faz requisições HTTP para buscar dados em tempo real:

```dart
class MovieAPIService {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
  ));
  
  Future<MovieResponse> getPopularMovies(int page) async {
    try {
      final response = await dio.get('movie/popular');
      return MovieResponse.fromJson(response.data);
    } catch (e) {
      print('Erro: $e');
      rethrow;
    }
  }
}
```

**Conceitos**:
- `Future<T>` para operação assincronizada
- `async/await` para esperar resultado
- `try/catch` para tratamento de erros
- `dio` = cliente HTTP com timeouts e interceptadores

### Assincronismo

Operações de rede são lentas. Não queremos travar a UI:

```dart
// ❌ ERRADO - Trava UI
var filmes = apiService.getPopularMovies();  // Espera aqui!
mostrarFilmes(filmes);

// ✅ CORRETO - Não trava
var filmes = await apiService.getPopularMovies();  // Continua
mostrarLoader();  // UI segue respondendo
```

Na UI, observamos com `.when()`:

```dart
asyncMovies.when(
  loading: () => Loader(),      // Mostrar enquanto carrega
  error: (e) => ErrorWidget(),  // Mostrar erro
  data: (movies) => List(),     // Mostrar dados
);
```

### Build Runner

Alguns arquivos são **gerados automaticamente**. Você não edita `.g.dart` ou `.freezed.dart`, o compilador gera para você:

```bash
# Quando editar models ou providers:
dart run build_runner build

# Arquivos gerados (NÃO editar):
# - providers.g.dart
# - movie.freezed.dart
# - movie.g.dart
# - app_routes.gr.dart
```

---

## Fluxo de Dados

### Como funciona uma busca de filmes?

```
1. UI (HomeScreen) chama:
   ref.watch(movieViewModelProvider)

2. Provider (movieViewModelProvider) gerencia:
   MovieViewModel viewModel = await criar_e_inicializar()

3. ViewModel faz setup:
   await movieAPIService.getPopularMovies()

4. API Service faz requisição HTTP:
   dio.get('https://api.themoviedb.org/3/movie/popular')

5. Response volta como JSON:
   {"results": [{"id": 1, "title": "Avatar", ...}]}

6. Parser automático (freezed):
   Movie.fromJson(json) → Movie object

7. ViewModel retorna lista:
   List<Movie> movies

8. Provider atualiza estado:
   movieViewModelProvider.data = viewModel

9. UI observa mudança:
   HomeScreen.build() executado novamente

10. Tela renderiza:
    ListView com filmes
```

---


## Estrutura Simplificada para Entender

Se você quiser entender a app rapidamente:

1. **main.dart** → Entrada da app
2. **lib/providers.dart** → Onde está o estado global
3. **lib/ui/movie_viewmodel.dart** → Lógica de busca de filmes
4. **lib/network/movie_api_service.dart** → Requisições HTTP
5. **lib/ui/screens/home/home_screen.dart** → Tela que você vê

Siga este caminho para entender o fluxo!

---

## Próximos Passos

### Para Casa (Setup Inicial)

- [ ] Clonar/Abrir projeto `movies`
- [ ] Criar conta no TheMovieDB
- [ ] Gerar API key
- [ ] Criar arquivo `.env` com chave
- [ ] `flutter pub get`
- [ ] `dart run build_runner build`
- [ ] `flutter run` (na web ou emulador)
- [ ] Explorar as telas e funcionalidades

### 🎯 Desafio da Aula

Execute o app **no seu smartphone via USB**. 

Instruções em: [movies/README.md](./movies/README.md) - seção "3️⃣ Celular via USB"

### Para Aprender Mais

- Leia `lib/providers.dart` para entender providers
- Leia `lib/network/movie_api_service.dart` para entender API calls
- Explore `lib/ui/screens/` para ver como telas usam providers
- Procure `.when()` para entender tratamento de estados assincronizados

---

## FAQ Rápido

**P: Por que tantas pastas?**  
R: Organização. Cada camada tem responsabilidade clara. Facilita manutenção.

**P: O que é esse arquivo .env?**  
R: Arquivo de configuração com dados sensíveis (API keys). NÃO fazer commit!

**P: Preciso editar arquivos .g.dart?**  
R: NÃO! Esses são gerados. Se editar, `build_runner build` sobrescreve.

**P: Por que `async/await`?**  
R: HTTP é lento. `async/await` não trava a UI enquanto busca dados.

**P: O que é `ref.watch()`?**  
R: "Observar" um provider. Quando dados mudam, UI reconstrói automaticamente.

**P: Como faço para sair do `flutter run`?**  
R: Pressione `Q` no terminal.
