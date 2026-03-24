import 'package:dart_examples/models/livro.dart';

class BibliotecaService {
  final List<Livro> _livros = [];

  void adicionarLivro(Livro livro) {
    _livros.add(livro);
  }

  void listarLivros() {
    print('[23] Livros na biblioteca:');
    for (final livro in _livros) {
      print('  - $livro');
    }
  }
}
