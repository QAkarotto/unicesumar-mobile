import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:movies/main.dart';

void main() {
  testWidgets('Main app shows the primary navigation tabs', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: MainApp()));

    await tester.pump();

    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Symbols.genres), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });
}
