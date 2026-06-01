import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/data/models/genre.dart';
import 'package:movies/data/models/genre_state.dart';
import 'package:movies/ui/screens/genres/genre_section.dart';

void main() {
  testWidgets('genre chips update the selected counter', (tester) async {
    var selectedCount = 0;
    final states = <GenreState>[
      GenreState(genre: const Genre(id: 28, name: 'Action'), isSelected: false),
      GenreState(genre: const Genre(id: 18, name: 'Drama'), isSelected: false),
    ];

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: CustomScrollView(
              slivers: [
                GenreSection(
                  genreStates: states,
                  isExpanded: true,
                  onGenresExpanded: (_) {},
                  onGenresSelected: (value) {
                    selectedCount = value.length;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );

    expect(find.text('0'), findsWidgets);

    await tester.tap(find.text('Action'));
    await tester.pump();

    expect(selectedCount, 1);
    expect(find.text('1'), findsWidgets);
  });
}
