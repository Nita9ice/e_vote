import 'dart:async';


import 'package:e_vote/Services/authservices.dart';
import 'package:e_vote/Services/firestoreservices.dart';
import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:e_vote/components/widgets/button.dart';
import 'package:e_vote/components/widgets/text_field.dart';

import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Controllers for input fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  // Controller for handling input in the password text field
  final TextEditingController emailController = TextEditingController();

  // Controller for handling input in the password text field
  final TextEditingController passwordController = TextEditingController();

  // Controller for handling input in the password text field
  final TextEditingController confirmPasswordController =
      TextEditingController();

 
Future<void> sendEmailverification()async{
 final emailLink = Emailservices();
 await emailLink.sendEmailVerification();
}


  //signUp for users and admin
  Future<bool> signUp() async {
<<<<<<< HEAD
    // print('selectedRole: $selectedRole');
=======
 
>>>>>>> 09c2e796852e803a3a9009a173e94c4303cf397e
    try {
      final auth = Authservices();
     
      final firestoreservices = Firestoreservices();
      final firstName = firstNameController.text.trim();
      final lastName = lastNameController.text.trim();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final confirmPassword = confirmPasswordController.text.trim();
      if (password != confirmPassword) {
        showSnackBar('password do not match');
      }
 if (firstName.isNotEmpty &&
          lastName.isNotEmpty &&
        password == confirmPassword) {
        await auth.signUp(email, password);
        await firestoreservices.uploadUserDetails(
          {firstName, lastName},
          email,
      
        );
       
        return true;
      }
      return false;
    } catch (e) {
      // print(e.toString());
    }
    return false;
  }

  //show snackbar
  void showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

 
  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  //navigate to login
  void emailVerificationScreen() {
    Navigator.pushNamed(context, '/email');
  }

  // //signout user after registeration
  

  @override
  Widget build(BuildContext context) {
    // Instantiate AppDimensions
    final dimensions = AppDimensions(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          // backgroung image
          image: DecorationImage(
            image: AssetImage('assets/images/background2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(dimensions.widthPercent(7.5)), // ~32.25px
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // space
                  SizedBox(height: 150),
                  // Main text
                  Text(
                    'Welcome Onboard',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),

                  // space
                  SizedBox(height: 31),

                  // Text field for user first name
                  MyTextField(
                    controller: firstNameController,
                    hintText: 'First name:',
                    
                  ),

                  // space
                  SizedBox(height: 31),

                  // Text field for user last name
                  MyTextField(
                    controller: lastNameController,
                    hintText: 'Last name:',

                    
                  ),

                  // space
                  SizedBox(height: 31),

                  // Text field for user email
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email:',

                    
                  ),

                  // space
                  SizedBox(height: 31),

                  // Text field for user  password
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password:',

                   
                  ),

                  // space
                  SizedBox(height: 31),

                  // Text field for user  confirm password
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password:',

                    
                  ),

                  SizedBox(height: 31),

                  

                  SizedBox(height: 20),
                  // Register button
                  MyButton(
                    buttonText: 'Register',
                    onPressed: () async {
                      final onsucess = await signUp();
                      if (onsucess) {
                    await sendEmailverification();
                        showSnackBar(
                          'A verification link has been sent to your email.\n'
  'Please check your inbox and spam folder.'
                        );
                        Timer(Duration(seconds: 5), () {
                          return emailVerificationScreen();
                        });
                      }
                      // print('tapped');
                      // print('tapped');
                    },
                  ),

                  SizedBox(height: 13),
                  // Create account text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'have an account already?',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                      

                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(255, 255, 255, 1),
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
      ),
    );
  }
}