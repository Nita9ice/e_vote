import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 450),
      
              // Main text
              const Text(
                'Welcome Onboard',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              const SizedBox(height: 10),
      
              // Button to navigate to login
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                icon: const Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              // const SizedBox(height: 20),
      
              // Logo image
              Expanded(
                child: Container(
                  // width: double.infinity,
                  
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/logo2.png',
                    width: double.infinity,
                    fit: BoxFit.fill,
                    
                    
                  ),
                ),
              ),
             
      
            
            ],
          ),
        ),
      ),
    );
  }
}
