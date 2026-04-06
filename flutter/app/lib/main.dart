import 'package:flutter/material.dart';

import 'models/filme_item.dart';
import 'models/tema_item.dart';
import 'widgets/filmes_listview.dart';
import 'widgets/temas_gridview.dart';

final List<FilmeItem> filmes = <FilmeItem>[
  const FilmeItem(
    titulo: 'A Origem',
    imageUrl: 'https://picsum.photos/seed/a-origem/600/350',
  ),
  const FilmeItem(
    titulo: 'Interestelar',
    imageUrl: 'https://picsum.photos/seed/interestelar/600/350',
  ),
  const FilmeItem(
    titulo: 'Cidade de Deus',
    imageUrl: 'https://picsum.photos/seed/cidade-de-deus/600/350',
  ),
  const FilmeItem(
    titulo: 'Matrix',
    imageUrl: 'https://picsum.photos/seed/matrix/600/350',
  ),
  const FilmeItem(
    titulo: 'Parasita',
    imageUrl: 'https://picsum.photos/seed/parasita/600/350',
  ),
];

final List<TemaItem> temas = <TemaItem>[
  const TemaItem(
    nome: 'Acao',
    imageUrl: 'https://picsum.photos/seed/acao/500/350',
    cor: Color(0xFF264653),
  ),
  const TemaItem(
    nome: 'Comedia',
    imageUrl: 'https://picsum.photos/seed/comedia/500/350',
    cor: Color(0xFF2A9D8F),
  ),
  const TemaItem(
    nome: 'Drama',
    imageUrl: 'https://picsum.photos/seed/drama/500/350',
    cor: Color(0xFFE76F51),
  ),
  const TemaItem(
    nome: 'Ficcao Cientifica',
    imageUrl: 'https://picsum.photos/seed/ficcao/500/350',
    cor: Color(0xFF1D3557),
  ),
  const TemaItem(
    nome: 'Suspense',
    imageUrl: 'https://picsum.photos/seed/suspense/500/350',
    cor: Color(0xFF6A4C93),
  ),
  const TemaItem(
    nome: 'Animacao',
    imageUrl: 'https://picsum.photos/seed/animacao/500/350',
    cor: Color(0xFFF4A261),
  ),
];

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aula - Movie App (ListView e GridView)',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1F6FEB)),
        useMaterial3: true,
      ),
      home: const TelaPrincipalMovieApp(),
    );
  }
}

// Passo 2: Estrutura da tela com StatefulWidget, Scaffold, SafeArea e Column.
class TelaPrincipalMovieApp extends StatefulWidget {
  const TelaPrincipalMovieApp({super.key});

  @override
  State<TelaPrincipalMovieApp> createState() => _TelaPrincipalMovieAppState();
}

class _TelaPrincipalMovieAppState extends State<TelaPrincipalMovieApp> {
  void _mostrarSnackBar(String mensagem) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(mensagem), duration: const Duration(seconds: 2)),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App - Colecoes com Flutter'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Filmes em Destaque',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            FilmesListView(
              filmes: filmes,
              onFilmeTap: (FilmeItem filme) {
                _mostrarSnackBar('Abrindo detalhes de "${filme.titulo}"...');
              },
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Text(
                'Categorias',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Expanded(
              child: TemasGridView(
                temas: temas,
                onTemaTap: (TemaItem tema) {
                  _mostrarSnackBar('Filtrando filmes de "${tema.nome}"...');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
