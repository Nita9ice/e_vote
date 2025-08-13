
import 'package:e_vote/components/widgets/button.dart';
import 'package:e_vote/components/widgets/text_field.dart';
import 'package:flutter/material.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // Controller for handling input in the email text field
  final TextEditingController emailController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      
      body: SafeArea(
        child: Container(
          width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/background2.jpg'),
              fit: BoxFit.cover)
            ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Center(
              child: Column(
                
                children: [
                  
                                  // space
                SizedBox(height: 241,),
                  // Main text
                  Text(
                    'Forgot Password',
                     style: TextStyle(
                   fontFamily: 'Roboto',
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(255, 255, 255, 1,)
                ),
                    
                  ),
                  const SizedBox(height: 100),
                  // sub text
                  Text(
                    'Enter your email address and we\'ll send you a link to reset your password.',
                    textAlign:TextAlign.center ,
                    style: TextStyle(
                   fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(255, 255, 255, 1,)
                ),
                  ),
                        
                  const SizedBox(height: 20),
                        
                  // Email field
                  MyTextField(controller: emailController, hintText: 'Email'),
                        
                  const SizedBox(height: 70),
                        
                  // Send Reset Link button
                  MyButton(
                    buttonText: 'Send Reset Link',
                    onPressed: (){},
                    
                  ),
                        
                  const SizedBox(height: 30),
                        
                  // Back to login
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Back to Login',
                        style: TextStyle(
                   fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(255, 255, 255, 1,)
                ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
