import 'dart:async';

import 'package:e_vote/Services/authservices.dart';
import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:flutter/material.dart';
import 'package:e_vote/components/widgets/button.dart';
import 'package:e_vote/components/widgets/text_field.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controller for handling input in the email text field
  final TextEditingController emailController = TextEditingController();

  // Controller for handling input in the password text field
  final TextEditingController passwordController = TextEditingController();

  // Variable to control password visibility
  bool obscurePassword = false;


 
 Future<bool>signIn()async{
  try{
  final email = emailController.text.trim();
  final password = passwordController.text.trim();
  final auth = Authservices();
  final emailServices = Emailservices();

  await auth.signIn(email, password);
  
 final verified =  await emailServices.emailVerified();
 if(verified){

  return true;
 }
 else{
await auth.signOut();
showSnackBar('please verify your email');
return false;
 }
}
catch(e){
  print(e.toString());
}
  return false;
 }
  
  void showSnackBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
Future<void> successMessage()async{
  showDialog(context: context, builder: (context){
    return 

    Image.asset('assets/images/logo.png');
    /*
    AlertBoxStatus(
      onPressed: (){},
      containerText: 'Success', containerImage: Image.asset('assets/images/logo.png'));

    
    */
  } );
}
// navigate to dashboard
void navigateToDashbord(){
    Navigator.pushNamed(context, '/dashboard');

}


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Space
                  SizedBox(height: dimensions.heightPercent(26)), // ~242.32px
                  // Main text
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: dimensions.widthPercent(8.4), // ~36.12px
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  // Space
                  SizedBox(height: dimensions.heightPercent(2.4)), // ~22.37px
                  // Sub text
                  Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: dimensions.widthPercent(8.4), // ~36.12px
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  // Space
                  SizedBox(height: dimensions.heightPercent(4.3)), // ~40.08px
                  // Text field for user
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email:',
                  ),
                  
                   
              
                 
              
                   SizedBox(height: dimensions.heightPercent(4.5)), // ~41.94px
                  // Text field for password
                  MyTextField(
                
                    controller: passwordController,
                    hintText: 'Password:',
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
                  // Space
                  SizedBox(height: dimensions.heightPercent(1.5)), // ~13.98px
                  // Forgot password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgot');
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: dimensions.widthPercent(4.7), // ~20.21px
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  ),
              
                                  // Space
                
                  // Space
                  SizedBox(height: dimensions.heightPercent(6.6)), // ~61.51px
                  // Login button
                  MyButton(
                    buttonText: 'Login',
                    onPressed: () async{
                     final onSuccess = await signIn();
                     if(onSuccess){
                     
                
                    await successMessage();

                    await Future.delayed(Duration(seconds: 1));
                

                     navigateToDashbord();
                 
                     }

                       
                    },
                  ),
                  // Space
                  SizedBox(height: dimensions.heightPercent(0.9)), // ~8.39px
                  // Create account text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: dimensions.widthPercent(4.7), // ~20.21px
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1),
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
      ),
    );
  }
}