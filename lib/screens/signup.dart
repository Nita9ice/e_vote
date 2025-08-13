


import 'package:e_vote/components/widgets/button.dart';
import 'package:e_vote/components/widgets/text_field.dart';
import 'package:flutter/material.dart';



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
  final TextEditingController passwordController = TextEditingController();

  // Controller for handling input in the password text field
  final TextEditingController confirmPasswordController = TextEditingController();

// Stores the currently selected role from the dropdown.
String? selectedRole; 


// List of available roles the user can choose from.
  final List<String> roles = ['Super User', 'Admin', 'Voters'];


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
         width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              // backgroung image
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
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(255, 255, 255, 1,)
                ),
                ),
                    
                // space
                SizedBox(height: 31,),
              
                  
                // Text field for user first name 
                MyTextField(controller: firstNameController, 
                hintText: 'First name:',
                
                
                ),
                    
                // space
                SizedBox(height: 31,),
                    
              // Text field for user last name 
                MyTextField(controller: lastNameController, 
                hintText: 'Last name:',
                
                ),

                 // space
                SizedBox(height: 31,),


                // Text field for user email     
                MyTextField(controller: emailController, 
                hintText: 'Email:',
                
                ),

                 
            
                
                     // space
                SizedBox(height: 31,),
                    
              // Text field for user  password 
                MyTextField(controller: passwordController, 
                hintText: 'Password:',
                
                ),

                 // space
                SizedBox(height: 31,),
                    
                // Text field for user  confirm password 
                MyTextField(controller: confirmPasswordController, 
                hintText: 'Confirm Password:',
                
                ),


                 SizedBox(height: 31,),


// drop down selection
                 Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           

            // Container  that carries the drop down selection
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                 color: Color.fromRGBO(255, 255, 255, 1,),
                borderRadius: BorderRadius.circular(20), 
                border: Border.all(color: Colors.grey.shade400, width: 1), 
              ),
              child: DropdownButton<String>(
                value: selectedRole,
                isExpanded: true,
                underline: SizedBox(), 
                hint: Text('Choose a role',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(0, 0, 0, 1,)
                ),
                ),
                items: roles.map((role) {
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

 SizedBox(height: 30,),
 // Register button
                MyButton(buttonText: 'Register', 
                onPressed: (){
                  // Navigate to verify email screen
                  
                     Navigator.pushNamed(context, '/email');
                    
                  
                         
                },
                    
                ),

               
                     
                
                SizedBox(height: 13,),
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
                  color: Color.fromRGBO(255, 255, 255, 1,)
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