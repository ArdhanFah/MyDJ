// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:mydj/main.dart';

void main() {
  testWidgets('MyDJ home page renders', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Jurnal Harian Guru'), findsOneWidget);
    expect(find.text('Lihat Jurnal'), findsOneWidget);
    expect(find.text('Buat Jurnal'), findsOneWidget);
  });
}
