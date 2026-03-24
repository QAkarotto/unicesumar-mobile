import '../models/livro_exercicio.dart';

class BibliotecaExercicioService {
  final List<LivroExercicio> _livros = [];

  void adicionarLivro(LivroExercicio livro) {
    _livros.add(livro);
  }

  void listarLivros() {
    print('[23] Livros cadastrados na biblioteca:');
    for (final livro in _livros) {
      print('  - $livro');
    }
  }
}
