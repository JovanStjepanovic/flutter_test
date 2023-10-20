import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test2/home_screen_2.dart';
import 'package:test2/main.dart' as app;


void main (){

IntegrationTestWidgetsFlutterBinding.ensureInitialized();



group('end to end test', () {


  testWidgets('correct credentials', (widgetTester) async {

   app.main();

   await widgetTester.pumpAndSettle();
   await widgetTester.enterText(find.byType(TextFormField).at(0), 'username');
   await widgetTester.enterText(find.byType(TextFormField).at(1), 'password');
   await widgetTester.tap(find.byType(ElevatedButton));
    
    await widgetTester.pumpAndSettle();


    expect(find.byType(HomeScreen2), findsOneWidget);




  });


  testWidgets('wrong credents', (widgetTester) async {


   app.main();
   await widgetTester.pumpAndSettle();

   await widgetTester.enterText(find.byType(TextFormField).at(0), 'tester');
   await widgetTester.enterText(find.byType(TextFormField).at(1), '123');
   await widgetTester.tap(find.byType(ElevatedButton));
 
   await widgetTester.pumpAndSettle();
   expect(find.byType(AlertDialog), findsOneWidget);

  });






 });







}