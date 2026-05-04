import 'package:flutter_test/flutter_test.dart';

import 'package:example_application/main.dart';
import 'package:example_application/models/filme_item.dart';

void main() {
  testWidgets('Renderiza tela inicial de filmes', (WidgetTester tester) async {
    await tester.pumpWidget(
      MainApp(
        filmes: const <FilmeItem>[
          FilmeItem(
            titulo: 'A Origem',
            imageUrl: 'https://example.com/poster.jpg',
          ),
        ],
      ),
    );

    expect(find.text('Movie App - Lista de Filmes'), findsOneWidget);
    expect(find.text('A Origem'), findsOneWidget);
  });
}
