import 'package:e_vote/components/widgets/button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar 
      appBar: AppBar(
        title: Text('Welcome'),
      ) ,

// body of the screen
      body: Column(
        // this put everyting in te centre
        mainAxisAlignment: MainAxisAlignment.center,

        // list of every other widget in the body
        children: [

          // App logo
          Image.asset(''),

          // space
          SizedBox(height: 30,),

          // Main Text
          Text(''),

          // Tagline or sub text
          Text(''),

          // Row that will carry the buttons for registration and login
          Row(
            // list of widget in the row
            children: [
              
              // Button to register an account
              MyButton(buttonText: 'Register', onPressed: (){}),

              // space
              SizedBox(width: 50,),

              //Button to login to your account
              MyButton(buttonText: 'Login', onPressed: (){})

            ],
          )

        ],
      ),
    );
  }
}