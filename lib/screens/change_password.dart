import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:e_vote/components/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:e_vote/components/widgets/text_field.dart';

class ChangePassword extends StatefulWidget {
const  ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  // Variable to control password visibility
  bool obscurePassword = false;

  @override
  Widget build(BuildContext context) {
    // Create an AppDimensions object for responsive sizing
    final dims = AppDimensions(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 SizedBox(height: dims.heightPercent(5)), // Top spacing

                // Back button aligned to the top-left corner
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: dims.widthPercent(10), // Responsive size
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Navigate back
                    },
                  ),
                ),
                const SizedBox(height: 100),

                Text('Create New Password',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: dims.fontSizeLarge,
                    // fontWeight: FontWeight.bold,
                   color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),

                const SizedBox(height: 20),

                Text('Your new password must be different \nfrom previous used passwords.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: dims.fontSizeSmall,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),

                 const SizedBox(height: 80),

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
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Must be at least 8 characters',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: dims.fontSizeSmall,
                      // fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
                const SizedBox(height: 60),

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
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Both passwords must match',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: dims.fontSizeSmall,
                      // fontWeight: FontWeight.bold,
                     color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
                const SizedBox(height: 80),

                // Spacer(),  

                MyButton(buttonText: 'Reset Password', onPressed: (){}),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
