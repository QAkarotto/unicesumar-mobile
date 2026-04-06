import 'package:flutter/material.dart';

import '../models/tema_item.dart';

class TemasGridView extends StatelessWidget {
  const TemasGridView({
    super.key,
    required this.temas,
    required this.onTemaTap,
  });

  final List<TemaItem> temas;
  final ValueChanged<TemaItem> onTemaTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      itemCount: temas.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.6,
      ),
      itemBuilder: (BuildContext context, int index) {
        final TemaItem tema = temas[index];

        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => onTemaTap(tema),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black12),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  tema.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (
                        BuildContext context,
                        Object error,
                        StackTrace? stackTrace,
                      ) {
                        return Container(
                          color: tema.cor.withValues(alpha: 0.85),
                        );
                      },
                ),
                Container(color: tema.cor.withValues(alpha: 0.45)),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      tema.nome,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
