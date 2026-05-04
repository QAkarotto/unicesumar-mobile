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
