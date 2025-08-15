import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_vote/Services/authservices.dart';
import 'package:e_vote/Services/firestoreservices.dart';
import 'package:e_vote/components/widgets/button.dart';
import 'package:e_vote/components/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  // Stores the currently selected role from the dropdown.
  String? selectedRole;

  // List of available roles the user can choose from.
  final List<String> roles = ['Super User', 'Admin', 'Voters'];
  //signUp for users and admin
  Future<bool> signUp() async {
    print('selectedRole: $selectedRole');
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
          selectedRole == 'Admin') {
        await auth.signUp(email, password);
        await firestoreservices.uploadAdminDetails({
          firstName,
          lastName,
        }, email);
        await firestoreservices.uploadUserDetails(
          {firstName, lastName},
          email,
          selectedRole.toString(),
        );
        return true;
      } else if (firstName.isNotEmpty &&
          lastName.isNotEmpty &&
          selectedRole == 'Voters') {
        await auth.signUp(email, password);
        await firestoreservices.uploadUserDetails(
          {firstName, lastName},
          email,
          selectedRole.toString(),
        );
        return true;
      }
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  //show snackbar
  void showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  //disposing to avoid memory leaks
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
  void navigateToLogin() {
    Navigator.pushNamed(context, '/login');
  }

  // //signout user after registeration
  // Future<void> signOut() async {
  //   final auth = Authservices();
  //   await auth.signOut();
  // }

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
                    onPressed: () {},
                  ),

                  // space
                  SizedBox(height: 31),

                  // Text field for user last name
                  MyTextField(
                    controller: lastNameController,
                    hintText: 'Last name:',

                    onPressed: () {},
                  ),

                  // space
                  SizedBox(height: 31),

                  // Text field for user email
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email:',

                    onPressed: () {},
                  ),

                  // space
                  SizedBox(height: 31),

                  // Text field for user  password
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password:',

                    onPressed: () {},
                  ),

                  // space
                  SizedBox(height: 31),

                  // Text field for user  confirm password
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password:',

                    onPressed: () {},
                  ),

                  SizedBox(height: 31),

                  // drop down selection
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container  that carries the drop down selection
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1,
                          ),
                        ),
                        child: DropdownButton<String>(
                          value: selectedRole,
                          isExpanded: true,
                          underline: SizedBox(),
                          hint: Text(
                            'Choose a role',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          items:
                              roles.map((role) {
                                return DropdownMenuItem(
                                  value: role,
                                  child: Text(role),
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

                  SizedBox(height: 20),
                  // Register button
                  MyButton(
                    buttonText: 'Register',
                    onPressed: () async {
                      final onsucess = await signUp();
                      if (onsucess) {
                        // await signOut();
                        showSnackBar(
                          'a verification link has been sent to your email\n please verify and login',
                        );
                        Timer(Duration(seconds: 5), () {
                          return navigateToLogin();
                        });
                      }
                      // print('tapped');
                      print('tapped');
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
