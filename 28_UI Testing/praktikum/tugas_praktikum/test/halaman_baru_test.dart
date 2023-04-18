import 'package:belajar/pages/halaman_baru.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'test halaman yang belum pernah dibuat',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: HalamanBaru(),
      ));
      expect(find.text('Halaman Baru'), findsNothing);
    },
  );
}
