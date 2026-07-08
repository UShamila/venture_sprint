import 'package:flutter/material.dart';
import '../../screens/splash/splash_screen.dart';
import '../../screens/auth/login_screen.dart';


class AppRoutes {


  static Map<String, WidgetBuilder> routes = {


    "/": (context) => const SplashScreen(),


    "/login": (context) => const LoginScreen(),


  };


}