import 'package:flutter/material.dart';

class TemaItem {
  const TemaItem({
    required this.nome,
    required this.imageUrl,
    required this.cor,
  });

  final String nome;
  final String imageUrl;
  final Color cor;
}
