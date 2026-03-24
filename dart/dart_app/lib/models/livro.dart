class Livro {
  final String titulo;
  final String autor;

  Livro(this.titulo, this.autor);

  @override
  String toString() {
    return '$titulo - $autor';
  }
}
