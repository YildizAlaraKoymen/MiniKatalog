import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Mini Katalog ana ekrani acilir', (WidgetTester tester) async {
    await tester.pumpWidget(const MiniCatalogApp());
    await tester.pumpAndSettle();

    expect(find.text('Mini Katalog'), findsWidgets);
    expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });
}
