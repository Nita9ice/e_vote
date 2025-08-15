import 'dart:async';
import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to welcome screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/welcome');
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Instantiate AppDimensions
    final dimensions = AppDimensions(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: dimensions.heightPercent(36)), // ~335.52px
              Image.asset(
                'assets/images/logo.jpg',
                width: dimensions.widthPercent(78.6), // ~337.98px
                height: dimensions.heightPercent(33.3), // ~310.36px
              ),
              Text(
                'E-Vote',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: dimensions.widthPercent(11.2), // ~48.16px
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}