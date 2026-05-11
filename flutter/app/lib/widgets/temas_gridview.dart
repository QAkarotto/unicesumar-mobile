import 'package:flutter/material.dart';

import '../models/tema_item.dart';

class TemasGridView extends StatelessWidget {
  const TemasGridView({super.key, required this.temas});

  final List<TemaItem> temas;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      crossAxisCount: 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 0.95,
      children: <Widget>[
        for (final TemaItem tema in temas)
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),

              splashColor: Colors.white.withOpacity(0.35),
              highlightColor: Colors.white.withOpacity(0.20),

              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Tema selecionado: ${tema.nome}'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },

              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        tema.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (
                          BuildContext context,
                          Object error,
                          StackTrace? stackTrace,
                        ) {
                          return Container(
                            color: tema.cor.withValues(alpha: 0.85),
                          );
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: tema.cor.withValues(alpha: 0.45),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          tema.nome,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}