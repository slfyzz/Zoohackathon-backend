import 'package:flutter/material.dart';
import 'package:nature_finder/screens/director.dart';
import 'package:nature_finder/screens/intro.dart';
import 'package:nature_finder/screens/login.dart';
import 'package:nature_finder/screens/signup.dart';
import 'package:nature_finder/themes/theme.dart';
import 'package:nature_finder/utilites/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nature Finder',
      theme: theme1,
      initialRoute: '/',
      routes:{
        '/':(context)=>IntroScreen(),
        '/login' : (context)=>LogInScreen(),
        '/sign_up' : (context)=>SignUpScreen(),
        '/home' : (context)=>Director(screens),
      },
    );
  }



}
