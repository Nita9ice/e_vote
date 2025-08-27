import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:flutter/material.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dims = AppDimensions(context);

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
             
              // Vertical spacing before the main text
              SizedBox(height: 400),

              // Main text
              Text(
                'Welcome Onboard',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: dims.widthPercent(8), // 36px ≈ 8% of width
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              // SizedBox(height: dims.heightPercent(1.5)),

              // Button to navigate to login
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                icon: Icon(
                  Icons.arrow_circle_right_outlined,
                  size: dims.widthPercent(14), // 60px ≈ 14% of width
                  color: Colors.white,
                ),
              ),

              // Logo image taking remaining height
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo2.png',
                      width: double.infinity, // 47% of screen width
                      fit: BoxFit.cover,
                    ),
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
