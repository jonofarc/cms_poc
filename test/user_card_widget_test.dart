import 'package:cms_pocs/login/data/models/user.dart';
import 'package:cms_pocs/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MockUser extends User {
  MockUser(
      {required super.firstName,
      required super.lastName,
      required super.email,
      required super.phoneNumber,
      required super.country});

  @override
  String getFullName() => 'brian smith'; // Mock implementation for getFullName
}

void main() {
  testWidgets('UserCard displays correct user information',
      (WidgetTester tester) async {
    // Build the UserCard widget within a test environment
    await tester.pumpWidget(
      MaterialApp(
        home: UserCard(
            user: MockUser(
                firstName: "brian",
                lastName: "smith",
                email: "brian.smith@example.com",
                phoneNumber: "(941)444-4444",
                country: "US")),
      ),
    );

    // Verify that the UserCard displays the correct user information
    expect(find.text('Name: brian smith'),
        findsOneWidget); // Check for the user's name
  });
}
