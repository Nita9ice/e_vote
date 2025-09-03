import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:e_vote/components/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:e_vote/components/widgets/text_field.dart';

// A stateful widget that provides a UI for creating a new password
class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  // Controller for password input field
  final TextEditingController passwordController = TextEditingController();

  // Controller for confirm password input field
  final TextEditingController confirmPasswordController = TextEditingController();

  // Variable to toggle password visibility (true = visible, false = hidden)
  bool obscurePassword = false;

  @override
  Widget build(BuildContext context) {
    // Create an AppDimensions object for responsive sizing
    final dims = AppDimensions(context);

    return SafeArea(
      child: Scaffold(
        // Extends the body behind the app bar for seamless background
        extendBodyBehindAppBar: true,

        // Transparent AppBar with custom icon styling
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            size: 40,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),

        // Main body with background image
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background2.jpg"),
              fit: BoxFit.cover,
            ),
          ),

          // Adds padding around the content
          child: Padding(
            padding: const EdgeInsets.all(20),

            // Main column layout for text and input fields
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Page title
                Text(
                  'Create New Password',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: dims.fontSizeLarge,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),

                const SizedBox(height: 5),

                // Instruction text
                Text(
                  'Your new password must be different \nfrom previous used passwords.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: dims.fontSizeSmall,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),

                const SizedBox(height: 80),

                // Password input field with visibility toggle
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: !obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                    onPressed: () {
                      setState(() {
                        // Toggle password visibility
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // Confirm password input field with visibility toggle
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: !obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                    onPressed: () {
                      setState(() {
                        // Toggle password visibility
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 50),

                // Reset password button
                MyButton(
                  buttonText: 'Reset Password',
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 30,
                  ),
                  onPressed: () {
                    // function that will change the password will be inputed here
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
