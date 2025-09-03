import 'package:e_vote/Services/authservices.dart';
import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:flutter/material.dart';
import 'package:e_vote/components/widgets/button.dart';
import 'package:e_vote/components/widgets/text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // Controller for handling input in the email text field
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<bool> sendPasswordReset() async {
    try {
      final auth = Emailservices();
      await auth.sendPasswordReset(emailController.text.trim());
      return true;
    } catch (e) {
      e.toString();
      return false;
    }
  }

  void passwordResetMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'a password reset link has been sent to your email/n please check your inbox or spam folder',
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Instantiate AppDimensions
    final dimensions = AppDimensions(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: dimensions.widthPercent(7.5),
            ), // ~32.25px
            child: Center(
              child: Column(
                children: [
                  // Space
                  SizedBox(height: dimensions.heightPercent(26)), // ~242.32px
                  // Main text
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: dimensions.widthPercent(8.4), // ~36.12px
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  // Space
                  SizedBox(height: dimensions.heightPercent(10.7)), // ~99.64px
                  // Sub text
                  Text(
                    'Enter your email address and we\'ll send you a link to reset your password.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: dimensions.widthPercent(4.7), // ~20.21px
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  // Space
                  SizedBox(height: dimensions.heightPercent(2.2)), // ~20.50px
                  // Email field
                  MyTextField(controller: emailController, hintText: 'Email'),
                  // Space
                  SizedBox(height: dimensions.heightPercent(7.5)), // ~69.90px
                  // Send Reset Link button
                  MyButton(
                    buttonText: 'Send Reset Link',
                    onPressed: () async {
                      final success = await sendPasswordReset();
                      if (success) {
                        passwordResetMessage();
                  

                      }
                    },
                  ),
                  // Space
                  SizedBox(height: dimensions.heightPercent(3.2)), // ~29.82px
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
                          fontSize: dimensions.widthPercent(4.7), // ~20.21px
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1),
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
