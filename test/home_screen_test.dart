import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test2/home_screen.dart';
import 'package:test2/user_model.dart';
import 'package:test2/user_rep.dart';

void main() {
  testWidgets('Displays list of users with title as name and subtitle as email', (tester) async {
    
   
        final users = [
          
          User(id: 1, name: 'Mike', email: 'Mike@gmail.com'),
          User(id: 2, name: 'Jon', email: 'Jon@gmail.com')
       ];


    Future <List<User>> mokcGetUsers() {

     return Future.delayed( const Duration(seconds: 2),()=>users);
    }


   await   tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(
            futureUsers: mokcGetUsers()
            ),
            )
              );


         expect(find.byType(CircularProgressIndicator), findsOneWidget);

        
          
           expect(find.byType(AppBar), findsOneWidget);
           expect(find.text('Users'), findsOneWidget); 

               
          await   tester.pumpAndSettle();
              
           
           expect(find.byType(ListView), findsOneWidget);
            expect(find.byType(ListTile), findsNWidgets(users.length));


          for(final user in users){
           expect(find.text(user.name), findsOneWidget);
           expect(find.text(user.email), findsOneWidget);
          }



  });
}