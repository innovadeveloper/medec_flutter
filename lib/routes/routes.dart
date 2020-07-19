import 'package:flutter/material.dart';
import 'package:medec_app/pages/onboarding.dart';
import 'package:medec_app/pages/selection_city.dart';
import 'package:medec_app/pages/splash_screen.dart';

class AppRoutes {
  
 Map<String, WidgetBuilder> routes(){
   return {
        '/'  : (BuildContext context ) => SplashScreen(),
        '/selection_city'  : (BuildContext context ) => SelectionCity(),
        '/onboarding' : (BuildContext context ) => Onboarding(),
      };
 }
  
}