import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:movies/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('app launches and exposes the main tabs', (tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Genre'), findsOneWidget);
    expect(find.text('Favorites'), findsOneWidget);
  });
}
