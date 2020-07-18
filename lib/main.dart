import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primaryColor: Colors.deepPurple[600],
        accentColor: Colors.amber,
        textTheme: TextTheme(
          headline5: TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
              fontSize: 22.0,
              // fontStyle: FontStyle.italic,
              fontFamily: 'Poppins'),
          bodyText2: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
    );
  }
}
