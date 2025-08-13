import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:flutter/material.dart';
import 'package:e_vote/components/widgets/button.dart';
import 'package:e_vote/components/widgets/text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Controllers for input fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Password visibility toggles
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  // Dropdown role selection
  String? selectedRole;
  final List<String> roles = ['Super User', 'Admin', 'Voters'];

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Instantiate AppDimensions
    final dimensions = AppDimensions(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(dimensions.widthPercent(7.5)), // ~32.25px
          child: Center(
            child: Column(
              children: [
                // Space
                SizedBox(height: dimensions.heightPercent(16.1)), // ~150.05px
                // Main text
                Text(
                  'Welcome Onboard',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: dimensions.widthPercent(8.4), // ~36.12px
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                // Space
                SizedBox(height: dimensions.heightPercent(3.3)), // ~30.76px
                // Text field for first name
                MyTextField(
                  controller: firstNameController,
                  hintText: 'First name:',
                ),
                // Space
                SizedBox(height: dimensions.heightPercent(3.3)), // ~30.76px
                // Text field for last name
                MyTextField(
                  controller: lastNameController,
                  hintText: 'Last name:',
                ),
                // Space
                SizedBox(height: dimensions.heightPercent(3.3)), // ~30.76px
                // Text field for email
                MyTextField(
                  controller: emailController,
                  hintText: 'Email:',
                ),
                // Space
                SizedBox(height: dimensions.heightPercent(3.3)), // ~30.76px
                // Text field for password
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password:',
                  obscureText: obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility : Icons.visibility_off,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
                // Space
                SizedBox(height: dimensions.heightPercent(3.3)), // ~30.76px
                // Text field for confirm password
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password:',
                  obscureText: obscureConfirmPassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                    onPressed: () {
                      setState(() {
                        obscureConfirmPassword = !obscureConfirmPassword;
                      });
                    },
                  ),
                ),
                // Space
                SizedBox(height: dimensions.heightPercent(3.2)), // ~29.82px
                // Dropdown selection
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: dimensions.widthPercent(2.8)), // ~12.04px
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(dimensions.widthPercent(4.7)), // ~20.21px
                        border: Border.all(color: Colors.grey.shade400, width: 1),
                      ),
                      child: DropdownButton<String>(
                        value: selectedRole,
                        isExpanded: true,
                        underline: const SizedBox(),
                        iconSize: 30,
                        hint: Text(
                          'Choose a role',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: dimensions.widthPercent(4.7), // ~20.21px
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                        items: roles.map((role) {
                          return DropdownMenuItem(
                            value: role,
                            child: Text(
                              role,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: dimensions.widthPercent(4.7), // ~20.21px
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedRole = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                // Space
                SizedBox(height: dimensions.heightPercent(3.2)), // ~29.82px
                // Register button
                MyButton(
                  buttonText: 'Register',
                  onPressed: () {
                    Navigator.pushNamed(context, '/email');
                  },
                ),
                // Space
                SizedBox(height: dimensions.heightPercent(1.4)), // ~13.05px
                // Create account text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'have an account already?',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: dimensions.widthPercent(4.7), // ~20.21px
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(255, 255, 255, 1),
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
                          fontSize: dimensions.widthPercent(4.7), // ~20.21px
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
    );
  }
}