import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:e_vote/components/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:e_vote/components/widgets/text_field.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

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
            padding: const EdgeInsets.all(26),
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

                Row( 
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
         /*        IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.arrow_back),
                    color: const Color.fromRGBO(255, 255, 255, 1),                   
                    tooltip: 'Back',
                    ),*/   
                    Text(
                      "Edit Profile",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: dims.fontSizeLarge,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ],
               
                ),
                const SizedBox(height: 62),

                MyTextField(
                  controller: nameController,
                  hintText: "First Name",
                ),
                const SizedBox(height: 40),

                MyTextField(
                  controller: usernameController,
                  hintText: "Last Name",
                ),
                const SizedBox(height: 40),

                

                
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                ),
                // const SizedBox(height: 100),

                Spacer(),

                MyButton(buttonText: 'Save', onPressed: (){}),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
