import 'package:e_vote/components/widgets/button.dart';
import 'package:e_vote/components/widgets/text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controller for handling input in the email text field
  final TextEditingController usernameController = TextEditingController();

  // Controller for handling input in the password text field
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
         width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/background2.jpg'),
              fit: BoxFit.cover)
            ),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              
              children: [
                // space
                SizedBox(height: 241,),
                // Main text 
                Text('Welcome Back',
                style: TextStyle(
                   fontFamily: 'Roboto',
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(255, 255, 255, 1,)
                ),
                ),
                    
                // space
                SizedBox(height: 22,),
                    
                // sub text
                Text('Login',
                style: TextStyle(
                   fontFamily: 'Roboto',
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(255, 255, 255, 1,)
                ),
                ),
                    
                // space
                SizedBox(height: 40,),
                    
                // Text field for user 
                MyTextField(controller: usernameController, 
                hintText: 'Username:',
                
                
                ),
                    
                // space
                SizedBox(height: 42,),
                    
                MyTextField(controller: passwordController, 
                hintText: 'Password:',
                
                ),
                    
                // space
                SizedBox(height: 14,),
                    
                // Forgot password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Navigate to forgot password screen
                          Navigator.pushNamed(context, '/forgot');
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                             fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(255, 255, 255, 1,)
                ),
                          
                        ),
                      ),
                    ),
                    
                     // space
                SizedBox(height: 61,),
                    
                // login button
                MyButton(buttonText: 'Login', onPressed: (){
                   Navigator.pushNamed(context, '/forgot');
                },
                
                ),
                    
                SizedBox(height: 8,),
                    
                 // Create account text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                             fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(255, 255, 255, 1,)
                ),
                          
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: Text(
                            'Sign up',
                             style: TextStyle(
                               fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(255, 255, 255, 1,)
                ),
                            
                          ),
                        ),
                      ],
                    ),
                    
                    
              ],
            ),
          ),
        ),
      ),
    );
  }
}