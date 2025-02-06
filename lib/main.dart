import 'package:assignment1/screens/bottom_nav_bar_screen.dart';
import 'package:assignment1/screens/code_verification_screen.dart';
import 'package:assignment1/screens/details_screen.dart';
import 'package:assignment1/screens/forgot_password_screen.dart';
import 'package:assignment1/screens/login_screen.dart';
import 'package:assignment1/screens/reset_password_screen.dart';
import 'package:assignment1/screens/sign_up_screen.dart';
import 'package:assignment1/screens/subscription_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xFF11161F),
    systemNavigationBarColor: Color(0xFF11161F),
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //    home: BottomNavBarScreen(),
      home: LoginScreen(),
    );
  }
}
