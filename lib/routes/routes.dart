import 'package:flutter/material.dart';
import 'package:medec_app/main.dart';
import 'package:medec_app/pages/batery_info.dart';
import 'package:medec_app/pages/home.dart';
import 'package:medec_app/pages/login.dart';
import 'package:medec_app/pages/onboarding.dart';
import 'package:medec_app/pages/register_phone_number.dart';
import 'package:medec_app/pages/register_pin_verify.dart';
import 'package:medec_app/pages/selection_city.dart';
import 'package:medec_app/pages/splash_screen.dart';

class AppRoutes {
  
 Map<String, WidgetBuilder> routes(){
   return {
        '/'  : (BuildContext context ) => SplashScreen(),
        '/selection_city'  : (BuildContext context ) => SelectionCity(),
        '/onboarding' : (BuildContext context ) => Onboarding(),
        '/login' : (BuildContext context ) => Login(),
        '/register_phone_number' : (BuildContext context ) => RegisterPhoneNumber(),
        '/register_pin_verify' : (BuildContext context ) => RegisterPinVerify(),
        '/home' : (BuildContext context ) => Home(),
      };
 }
  
}