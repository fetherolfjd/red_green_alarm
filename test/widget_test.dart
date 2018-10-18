import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:red_green_alarm/main.dart';

void main() {
  testWidgets('App creates smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(new RedGreenApp());

    expect(find.byIcon(Icons.add_alarm), findsOneWidget);
  });
}
