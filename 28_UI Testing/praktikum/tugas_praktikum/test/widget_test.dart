import 'package:belajar/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'cari judul contact',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyHomePage(title: 'Contact'),
      ));
      expect(find.text('Contact'), findsOneWidget);
    },
  );

  testWidgets(
    'cari judul Create New Contacts',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyHomePage(title: 'Contact'),
      ));
      expect(find.text('Create New Contacts'), findsOneWidget);
    },
  );

  testWidgets(
    'coba button submit',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyHomePage(title: 'Contact'),
      ));
      await tester.press(find.text('Submit'));
      await tester.pump();
    },
  );
}
