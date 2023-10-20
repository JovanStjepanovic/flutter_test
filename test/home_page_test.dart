import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test2/counter_class.dart';
import 'package:test2/home_page.dart';

void main() {


testWidgets('home page test ', (widgetTester) async {



await widgetTester.pumpWidget(const MaterialApp(
          home: MyHomePage(
            title: 'home page'),
                          ));


  final tst1 = find.text('0');

  expect(tst1, findsOneWidget);

 
   final btn = find.byKey(const Key('increment_counter'));


  await widgetTester.tap(btn);

  await widgetTester.pump();

  final tst2 = find.text('1');
  final tst3 = find.text('0');

expect(tst2, findsOneWidget);
expect(tst3, findsNothing);


expect(find.byType(AppBar), findsOneWidget);


final tst4 = find.text("home page");


expect(tst4, findsOneWidget);





});








}