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
                const SizedBox(height: 133),

                Row( 
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
         /*        IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.arrow_back),
                    color: const Color.fromRGBO(255, 255, 255, 1),                   
                    tooltip: 'Back',
                    ),*/   
                    const Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ],
               
                ),
                const SizedBox(height: 62),

                MyTextField(
                  controller: nameController,
                  hintText: "Full Name",
                ),
                const SizedBox(height: 40),

                MyTextField(
                  controller: usernameController,
                  hintText: "Username",
                ),
                const SizedBox(height: 40),

                MyTextField(
                  controller: genderController,
                  hintText: "Gender",
                ),
                const SizedBox(height: 40),

                MyTextField(
                  controller: phoneController,
                  hintText: "Phone Number",
                ),
                const SizedBox(height: 40),

                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                ),
                const SizedBox(height: 60),

                Container(
                  width: 307,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(3, 58, 135, 1),
                        Color.fromRGBO(132, 166, 255, 1), 
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white, // White outline
                      width: 2,
                    ),
                  ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, // Transparent for gradient
                        shadowColor: Colors.transparent,     // Remove button shadow
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                                      ),
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
