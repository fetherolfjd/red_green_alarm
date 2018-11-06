import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:red_green_alarm/main.dart';
import 'package:red_green_alarm/src/color_text.dart';
import 'package:red_green_alarm/src/clock.dart';
import 'package:red_green_alarm/src/lights.dart';

void main() {
  testWidgets('App creates smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(new RedGreenApp());

    expect(find.byIcon(Icons.add_alarm), findsOneWidget);
    expect(find.byType(Clock), findsOneWidget);
    expect(find.byType(ColorText), findsNWidgets(2));
    expect(find.byType(GreenLight), findsOneWidget);
    expect(find.byType(RedLight), findsOneWidget);
  });
}
