import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  //this is set to display the splash screen within  secs
  void initState() {
    super.initState();

//after the timer counts navigate's t welcome screen.
    Timer(Duration (seconds: 3), (){
      Navigator.pushReplacementNamed(context, '/welcome');
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // centralise the App logo
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         //App Logo   
            Image.asset(''),
          ],
        ),
      ),
    );
  }
}