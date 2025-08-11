
import 'package:e_vote/components/widgets/button.dart';
import 'package:e_vote/components/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Controller for handling input in the email text field
  final TextEditingController firstNameController = TextEditingController();

  // Controller for handling input in the password text field
  final TextEditingController lastNameController = TextEditingController();

   // Controller for handling input in the password text field
  final TextEditingController emailController = TextEditingController();

  // Controller for handling input in the password text field
  final TextEditingController ninController = TextEditingController();

// Controller for handling input in the password text field
  final TextEditingController passwordController = TextEditingController();

  // Controller for handling input in the password text field
  final TextEditingController confirmPasswordController = TextEditingController();
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
                SizedBox(height: 150,),
                // Main text 
                Text('Welcome Onboard',
                style: GoogleFonts.roboto(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(255, 255, 255, 1,)
                ),
                ),
                    
                // space
                SizedBox(height: 31,),
                    
                
                    
                
                // Text field for user 
                MyTextField(controller: firstNameController, 
                hintText: 'First name:',
                onPressed: (){},
                
                ),
                    
                // space
                SizedBox(height: 31,),
                    
                MyTextField(controller: lastNameController, 
                hintText: 'Last name:',
                
                onPressed: () {
                  
                },),

                 // space
                SizedBox(height: 31,),
                    
                MyTextField(controller: emailController, 
                hintText: 'Email:',
                
                onPressed: () {
                  
                },),

                 // space
                SizedBox(height: 31,),
                    
                MyTextField(controller: ninController, 
                hintText: 'NIN Verification:',
                
                onPressed: () {
                  
                },),
                    
                     // space
                SizedBox(height: 31,),
                    
                MyTextField(controller: passwordController, 
                hintText: 'Password:',
                
                onPressed: () {
                  
                },),

                 // space
                SizedBox(height: 31,),
                    
                MyTextField(controller: confirmPasswordController, 
                hintText: 'Confirm Password:',
                
                onPressed: () {
                  
                },),
                // 
                
                SizedBox(height: 29,),
                // Register button
                MyButton(buttonText: 'Register', onPressed: (){},
                    
                ),
                     
                
                SizedBox(height: 13,),
                 // Create account text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'have an account already?',
                          style: GoogleFonts.roboto(
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
                            'Login',
                             style: GoogleFonts.roboto(
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