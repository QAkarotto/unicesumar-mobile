import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/ui/screens/movie_detail/button_row.dart';

void main() {
  testWidgets('favorite button notifies when tapped', (tester) async {
    var tapped = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ButtonRow(
            favoriteSelected: false,
            onFavoriteSelected: () {
              tapped++;
            },
          ),
        ),
      ),
    );

    expect(find.text('Favorite'), findsOneWidget);
    expect(find.text('Rate'), findsOneWidget);
    expect(find.text('Share'), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);

    await tester.tap(find.byIcon(Icons.favorite_border));
    await tester.pump();

    expect(tapped, 1);
  });

  testWidgets('selected favorite shows the filled icon', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ButtonRow(
            favoriteSelected: true,
            onFavoriteSelected: _noop,
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.favorite_outlined), findsOneWidget);
  });
}

void _noop() {}
