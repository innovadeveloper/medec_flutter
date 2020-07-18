import 'package:flutter/material.dart';
import 'package:medec_app/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: AppRoutes().routes(),
      theme: ThemeData(
        primaryColor: Colors.deepPurple[600],
        accentColor: Colors.amber,
        textTheme: TextTheme(
          headline5: TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontFamily: 'Poppins',
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
      // home: Scaffold(
      //   // appBar: AppBar(
      //   //   title: Text('Material App Bar'),
      //   // ),
      //   body: SplashScreen(),
      // ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Medec',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 50,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
