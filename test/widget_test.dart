import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tutorial1/main.dart';

void main() {
  testWidgets('product list and cart fit a short window', (tester) async {
    tester.view.physicalSize = const Size(1200, 629);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    expect(tester.takeException(), isNull);

    await tester.tap(find.text('Add to Cart').first);
    await tester.pump();
    expect(find.text('Total item: 1'), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.tap(find.text('Calculate'));
    await tester.pumpAndSettle();
    expect(find.text('Subtotal: RM 10.00'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
