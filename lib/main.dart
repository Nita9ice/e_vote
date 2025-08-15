// import 'package:e_vote/screens/register.dart';


import 'package:e_vote/screens/drop2.dart';
import 'package:e_vote/screens/dropdown.dart';
import 'package:e_vote/screens/splash.dart';
import 'package:e_vote/screens/login.dart';
import 'package:e_vote/screens/signup.dart';
import 'package:e_vote/screens/welcome.dart';
import 'package:e_vote/theme/theme_controller.dart';
import 'package:e_vote/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeController(),
      child: const EVote(),
    ),
  );
}

class EVote extends StatelessWidget {
  const EVote({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:Drop2(),
/*
      

// The first screen to display once the app is launch.
      initialRoute: '/',

// Defining the varous screen routes
      routes: {
        '/': (context) => SplashScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
       
        '/signup': (context) =>SignupScreen(),
       
      },
*/
      

// Theme data for the App

// this is the default theme based on the device theme
themeMode: ThemeMode.system, 

// light theme
theme: AppTheme.lightTheme,
// dark theme
darkTheme: AppTheme.darkTheme,

);
  }
}