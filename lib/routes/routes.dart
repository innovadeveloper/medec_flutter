import 'package:flutter/material.dart';
import 'package:medec_app/main.dart';

class AppRoutes {
  
 Map<String, WidgetBuilder> routes(){
   return {
        '/'  : (BuildContext context ) => SplashScreen(),
        // 'selection_city'  : (BuildContext context ) => ScrollPage(),
        // 'onboarding' : (BuildContext context ) => BotonesPage(),
      };
 }
  
}