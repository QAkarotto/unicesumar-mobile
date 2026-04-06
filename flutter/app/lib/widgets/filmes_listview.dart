import 'package:flutter/material.dart';

import '../models/filme_item.dart';

class FilmesListView extends StatelessWidget {
  const FilmesListView({
    super.key,
    required this.filmes,
    required this.onFilmeTap,
  });

  final List<FilmeItem> filmes;
  final ValueChanged<FilmeItem> onFilmeTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filmes.length,
        itemBuilder: (BuildContext context, int index) {
          final FilmeItem filme = filmes[index];

          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () => onFilmeTap(filme),
              child: Container(
                width: 240,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      filme.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (
                            BuildContext context,
                            Object error,
                            StackTrace? stackTrace,
                          ) {
                            return Container(
                              color: const Color(0xFF1F6FEB),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.broken_image_rounded,
                                color: Colors.white,
                                size: 36,
                              ),
                            );
                          },
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[Color(0x33000000), Color(0xCC000000)],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            filme.titulo,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
