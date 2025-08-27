import 'package:flutter/material.dart';
import 'package:e_vote/components/widgets/text_field.dart'; 

class JoinVoteScreen extends StatefulWidget {
  const JoinVoteScreen({super.key});

  @override
  State<JoinVoteScreen> createState() => _JoinVoteScreenState();
}

class _JoinVoteScreenState extends State<JoinVoteScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background2.jpg"), // background image
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Join Vote",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),

                MyTextField(
                  controller: emailController,
                  hintText: "Enter your email",
                ),
                const SizedBox(height: 20),

                MyTextField(
                  controller: linkController,
                  hintText: "Enter vote link",
                ),
                const SizedBox(height: 40),

                Container(
                  width: 307, 
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(3, 58, 135, 1),   // Dark blue
                        Color.fromRGBO(132, 166, 255, 1), // Light blue
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
                    onPressed: () {
                      // function
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, // Transparent for gradient
                      shadowColor: Colors.transparent,     // Remove button shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 255, 255, 1),
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
