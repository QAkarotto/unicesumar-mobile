import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/filme_item.dart';
import 'models/tema_item.dart';
import 'routes/routes.dart';
import 'widgets/filmes_listview.dart';
import 'widgets/temas_gridview.dart';

final _appRouter = Routes();

List<FilmeItem> filmesGlobais = [];

const List<TemaItem> temas = <TemaItem>[
  TemaItem(
    nome: 'Ação',
    imageUrl: 'https://picsum.photos/seed/acao/500/350',
    cor: Color(0xFF264653),
  ),
  TemaItem(
    nome: 'Comédia',
    imageUrl: 'https://picsum.photos/seed/comedia/500/350',
    cor: Color(0xFF2A9D8F),
  ),
  TemaItem(
    nome: 'Drama',
    imageUrl: 'https://picsum.photos/seed/drama/500/350',
    cor: Color(0xFFE76F51),
  ),
  TemaItem(
    nome: 'Ficção Científica',
    imageUrl: 'https://picsum.photos/seed/ficcao/500/350',
    cor: Color(0xFF1D3557),
  ),
  TemaItem(
    nome: 'Suspense',
    imageUrl: 'https://picsum.photos/seed/suspense/500/350',
    cor: Color(0xFF6A4C93),
  ),
  TemaItem(
    nome: 'Animação',
    imageUrl: 'https://picsum.photos/seed/animacao/500/350',
    cor: Color(0xFFF4A261),
  ),
];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final List<FilmeItem> filmes = await carregarFilmes();

  runApp(
    MainApp(filmes: filmes),
  );
}

Future<List<FilmeItem>> carregarFilmes() async {
  final String jsonString = await rootBundle.loadString(
    'assets/data/filmes.json',
  );

  final List<dynamic> dados = jsonDecode(jsonString) as List<dynamic>;

  return dados
      .cast<Map<String, dynamic>>()
      .map(FilmeItem.fromJson)
      .toList(growable: false);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.filmes});

  final List<FilmeItem> filmes;

  @override
  Widget build(BuildContext context) {
    filmesGlobais = filmes;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData( 
        colorScheme: ColorScheme.fromSeed( seedColor: const Color(0xFF1F6FEB), ),
        useMaterial3: true,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}

@RoutePage()
class TelaPrincipalScreen extends StatelessWidget {
  const TelaPrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App - Lista de Filmes'),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Temas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(flex: 1, child: TemasGridView(temas: temas)),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Text(
                'Filmes em Destaque',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Expanded(
              flex: 4,
              child: FilmesListView(
                filmes: filmesGlobais,

                onTap: (filme) {
                  context.pushRoute(
                    DetalhesFilmeRoute(
                      filme: filme,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

@RoutePage()
class DetalhesFilmeScreen extends StatelessWidget {
  const DetalhesFilmeScreen({
    super.key,
    required this.filme,
  });

  final FilmeItem filme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Filme'),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: <Widget>[
              SizedBox(
                width: 320,
                height: 180,

                child: Image.network(
                  filme.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                filme.titulo,
                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}