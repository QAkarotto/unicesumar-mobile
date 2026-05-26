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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FilmeItem) return false;
    return titulo == other.titulo && imageUrl == other.imageUrl;
  }

  @override
  int get hashCode => titulo.hashCode ^ imageUrl.hashCode;
}