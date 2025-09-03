import 'dart:async';
import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:flutter/material.dart';

// Splash screen displayed when the app starts.
// Shows the app logo and title, then automatically navigates
// to the welcome screen after a short delay.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer that navigates to the welcome screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    
// This is a  variable 'dims' that holds an AppDimensions object,
// which provides responsive sizing values based on the current context.
    final dims = AppDimensions(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          // Background image for the splash screen
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background1.jpg'),
              fit: BoxFit.cover, // Cover the entire screen
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Vertically center all children
              children: [
                 SizedBox(height: dims.heightPercent(10)),
                // App logo
                Image.asset(
                  'assets/images/logo.png',
                  
                ),
      
                // Responsive gap between logo and text
                SizedBox(height: dims.spacingSmall),
      
                // App title text
                Text(
                  'E-Vote',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: dims.fontSizeXLarge, // XLarge responsive font
                    fontWeight: FontWeight.w700,   
                    color: const Color.fromRGBO(255, 255, 255, 1), 
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
