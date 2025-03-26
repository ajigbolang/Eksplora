import 'package:flutter/material.dart';
import 'package:eksplora/screen/splash_screen.dart';
import 'package:eksplora/screen/auth_login.dart';
import 'package:eksplora/screen/home_screen.dart';
import 'package:eksplora/screen/cart_screen.dart';
//import 'package:eksplora/screen/admin/dashboard_screen.dart';
//import 'package:eksplora/screen/admin/admin_home_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => SplashScreen(),
  '/login': (context) => AuthLogin(),
  '/home': (context) => HomeScreen(),
  '/cart': (context) => CartScreen(),
  //'/admin/dashboard': (context) => DashboardScreen(),
  //'/admin/home': (context) => AdminHomeScreen(),
};
