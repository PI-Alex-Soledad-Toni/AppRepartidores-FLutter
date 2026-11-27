import 'package:flutter_test/flutter_test.dart';
import 'package:apprepartidores_flutter/main.dart';

void main() {
  testWidgets('La aplicación muestra el nombre BatoiLOGIC',
          (WidgetTester tester) async {
        await tester.pumpWidget(const BatoiLogicApp());

        expect(find.text('BatoiLOGIC'), findsOneWidget);
      });
}
