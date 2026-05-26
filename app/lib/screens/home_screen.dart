import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../models/filme_item.dart';
import '../models/tema_item.dart';
import '../widgets/filmes_listview.dart';
import '../widgets/temas_gridview.dart';
import '../routes/app_router.dart';

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

@RoutePage()
class TelaPrincipalMovieScreen extends StatelessWidget {
  const TelaPrincipalMovieScreen({super.key});

  static const List<FilmeItem> filmes = <FilmeItem>[
    FilmeItem(
      titulo: 'Interestelar',
      imageUrl: 'https://picsum.photos/seed/interestelar/500/350',
    ),
    FilmeItem(
      titulo: 'Batman',
      imageUrl: 'https://picsum.photos/seed/batman/500/350',
    ),
  ];

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
                filmes: filmes,
                onTap: (filme) {
                  context.router.push(DetalhesFilmeRoute(filme: filme));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
