import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:e_vote/components/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:e_vote/components/widgets/text_field.dart';

// A stateless widget that provides a UI for editing user profile details
class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  // Controllers for text fields to capture input
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

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

            // Centers the content vertically and horizontally
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title text
                  Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: dims.fontSizeLarge, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),

                  const SizedBox(height: 50),

                  // TextField for first name
                  MyTextField(
                    controller: firstNameController,
                    hintText: "First Name",
                  ),

                  const SizedBox(height: 20),

                  // TextField for last name
                  MyTextField(
                    controller: lastNameController,
                    hintText: "Last Name",
                  ),

                  const SizedBox(height: 20),

                  // TextField for email
                  MyTextField(
                    controller: emailController,
                    hintText: "Email",
                  ),

                  const SizedBox(height: 50),

                  // Save button
                  MyButton(
                    buttonText: 'Save',
                    onPressed: () {
                     //function to save the edited profile will be input here
                    },
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 50,
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
