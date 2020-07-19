import 'package:flutter/material.dart';
import 'package:medec_app/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/onboarding',
      routes: AppRoutes().routes(),
      theme: ThemeData(
        primaryColor: Colors.deepPurple[600],
        accentColor: Colors.amber,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepPurple[600],
        ),
        textTheme: TextTheme(
          headline5: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
          headline6: TextStyle(
              fontSize: 14.0,
              // fontStyle: FontStyle.italic,
              fontFamily: 'Poppins'),
          bodyText2: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      // home: Scaffold(
      //   // appBar: AppBar(
      //   //   title: Text('Material App Bar'),
      //   // ),
      //   body: SplashScreen(),
      // ),
    );
  }
}
