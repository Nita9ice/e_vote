import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:flutter/material.dart';

// This code  displays the welcome screen of the app
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

// This is a  variable 'dims' that holds an AppDimensions object,
// which provides responsive sizing values based on the current context.
final dims = AppDimensions(context);


    return Scaffold(
      body: Container(

        // Background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background1.jpg'),
            fit: BoxFit.cover, // Cover entire screen with background image
          ),
        ),
        child: Center(
          child: Column(
            children: [
              // Add vertical spacing equal to 45% of screen height
              SizedBox(height: dims.heightPercent(45)),

              // Main welcome text
              Text(
                'Welcome Onboard',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: dims.fontSizeLarge, // Responsive large font size
                  fontWeight: FontWeight.w700,   
                  color: const Color.fromRGBO(255, 255, 255, 1), 
                ),
              ),

              // Space between the welcome text and button
              SizedBox(height: dims.spacingMedium),

              // Icon button that navigates to login screen
              IconButton(
                onPressed: () {
                  // Navigate to the login screen 
                  Navigator.pushNamed(context, '/login');
                },
                icon: Icon(
                  Icons.arrow_circle_right_outlined,
                  size: dims.widthPercent(12), // Responsive icon size (12% of width)
                  color: Colors.white, 
                ),
              ),

              // Flexible space for logo (fills remaining height)
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/logo2.png',
                    width: dims.widthPercent(100), // Take full screen width
                    fit: BoxFit.cover, 
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
