class LivroExercicio {
  final String titulo;
  final String autor;

  LivroExercicio(this.titulo, this.autor);

  @override
  String toString() {
    return '$titulo - $autor';
  }
}
