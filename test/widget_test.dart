// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sadhusearch/main.dart'; // Import the app's main file.

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp()); // Pump the widget for testing.

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget); // Check if '0' is found on the screen.
    expect(find.text('1'), findsNothing); // Check if '1' is not found on the screen.

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add)); // Simulate tapping the add icon.
    await tester.pump(); // Trigger a frame after the tap.

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing); // Check if '0' is not found on the screen.
    expect(find.text('1'), findsOneWidget); // Check if '1' is found on the screen.
  });
}
