import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/ui/screens/genres/genre_search_row.dart';

void main() {
  testWidgets('search button sends the current query', (tester) async {
    String? submittedQuery;

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: GenreSearchRow((value) {
              submittedQuery = value;
            }),
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'Matrix');
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    expect(submittedQuery, 'Matrix');
  });

  testWidgets('clear button empties the text field', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: GenreSearchRow(_noop),
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'Inception');
    expect(find.text('Inception'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.close));
    await tester.pump();

    expect(find.text('Inception'), findsNothing);
  });
}

void _noop(String value) {}
