import 'package:e_commerce_app/e_commerce_app.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(ECommerceApp());
  });
}
