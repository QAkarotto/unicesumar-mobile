import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/filme_item.dart';
import 'routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final List<FilmeItem> filmes = await carregarFilmes();
  runApp(MainApp(filmes: filmes));
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
    final appRouter = AppRouter();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Aula - Lista de Filmes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1F6FEB)),
        useMaterial3: true,
      ),
      routerConfig: appRouter.config(),
    );
  }
}
