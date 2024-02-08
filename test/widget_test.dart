import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_adoption/main.dart';
import 'package:pet_adoption/models/pet.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget( MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Widget Test: HomeScreen displays pets', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget( MyApp());

    // Verify that HomeScreen displays pets.
    expect(find.byType(ListTile), findsWidgets);
  });

  test('Unit Test: Pet age calculation', () {
    // Create a sample pet
    final pet = Pet(name: 'Dog', age: 5, price: 100.0, image: 'assets/images/dog.png');

    // Test the age calculation function
    expect(pet.ageInMonths(), equals(60)); // Assuming 1 year = 12 months
  });
}
