import 'dart:async';
import 'package:e_vote/Services/authservices.dart';
import 'package:e_vote/Services/firestoreservices.dart';
import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:e_vote/components/widgets/button.dart';
import 'package:e_vote/components/widgets/text_field.dart';
import 'package:flutter/material.dart';

// Provides an interface for new users to create an account by 
// entering their details (e.g., name, email, and password).
// The screen handles form validation, displays feedback, and 
// connects with the authentication service to complete the 
// registration process. 
// Serves as the starting point for users who need to register 
// before accessing the app’s main features.


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Controllers for input fields

  // Controller for handling input in the first name text field
  final TextEditingController firstNameController = TextEditingController();

  // Controller for handling input in the last name text field
  final TextEditingController lastNameController = TextEditingController();

  // Controller for handling input in the email text field
  final TextEditingController emailController = TextEditingController();

  // Controller for handling input in the password text field
  final TextEditingController passwordController = TextEditingController();

  // Controller for handling input in the confirm password text field
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Toggle to show or hide password text
  bool obscurePassword = false;

  // Function to send email verification after registration
  Future<void> sendEmailverification() async {
    final emailLink = Emailservices();
    await emailLink.sendEmailVerification();
  }

  // Signup function with authentication and Firestore integration
  Future<bool> signUp() async {
    try {
      final auth = Authservices(); // Authentication service
      final firestoreservices = Firestoreservices(); // Firestore service

      // Get values from input fields
      final firstName = firstNameController.text.trim();
      final lastName = lastNameController.text.trim();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final confirmPassword = confirmPasswordController.text.trim();

      // Check if passwords match
      if (password != confirmPassword) {
        showSnackBar('password do not match');
      }

      // Check if all required fields are filled and passwords match
      if (firstName.isNotEmpty &&
          lastName.isNotEmpty &&
          password == confirmPassword) {
        await auth.signUp(email, password); // Register user
        await firestoreservices.uploadUserDetails(
          {firstName, lastName}, // Upload user details
          email,
        );
        return true;
      }
      return false;
    } catch (e) {
      // Catch error 
     
    }
    return false;
  }

  // Show a snackbar with a message
  void showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void dispose() {
    // Dispose controllers to free memory
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  // Navigate to email verification screen
  void emailVerificationScreen() {
    Navigator.pushNamed(context, '/email');
  }

  @override
  Widget build(BuildContext context) {

// This is a  variable 'dims' that holds an AppDimensions object,
// which provides responsive sizing values based on the current context.
    final dims = AppDimensions(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // Background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(dims.widthPercent(7.5)), // responsive padding
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: dims.heightPercent(20)), // top spacing

                  // Main text
                  Text(
                    'Welcome Onboard',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: dims.fontSizeLarge,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),

                  SizedBox(height: dims.spacingMedium),

                  // First name input field
                  MyTextField(
                    controller: firstNameController,
                    hintText: 'First name:',
                  ),

                  SizedBox(height: dims.spacingMedium),

                  // Last name input field
                  MyTextField(
                    controller: lastNameController,
                    hintText: 'Last name:',
                  ),

                  SizedBox(height: dims.spacingMedium),

                  // Email input field
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email:',
                  ),

                  SizedBox(height: dims.spacingMedium),

                  // Password input field with toggle visibility
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password:',
                    obscureText: !obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),

                  SizedBox(height: dims.spacingMedium),

                  // Confirm password input field
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password:',
                    obscureText: !obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),

                  SizedBox(height: dims.spacingMedium),

                  // Register button
                  MyButton(
                    buttonText: 'Register',
                    onPressed: () async {
                      final onsucess = await signUp();
                      if (onsucess) {
                        await sendEmailverification();
                        showSnackBar(
                          'A verification link has been sent to your email.\n'
                          'Please check your inbox and spam folder.',
                        );
                        // Navigate to verification screen after 5 seconds
                        Timer(const Duration(seconds: 5), () {
                          return emailVerificationScreen();
                        });
                      }
                    },
                  ),

                  SizedBox(height: dims.spacingSmall),

                  // Row for users who already have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Have an account already?',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: dims.fontSizeSmall,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to login
                          // Navigator.pushNamed(context, '/dashboard');
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: dims.fontSizeSmall,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(255, 255, 255, 1),
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
