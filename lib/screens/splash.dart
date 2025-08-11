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

//after the timer counts navigate's to welcome screen.
    Timer(Duration (seconds: 3), (){
      Navigator.pushReplacementNamed(context,  '/welcome');
    });
    
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/background1.jpg'))
       
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 335,),
              Image.asset('assets/images/logo.jpg',
              width: 338,
              height: 310,
              ),
              Text('E-Vote',
              style: TextStyle(
                              fontFamily: 'Roboto',
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(255, 255, 255, 1,)
                ),
                            
              )
            ],
          ),
          
            
        ),

      )
    
      );
      
    
  }
}