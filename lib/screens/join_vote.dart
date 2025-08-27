import 'package:e_vote/components/widgets/button.dart';
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
              // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back,
                         color: Colors.white,
                         size: 40,
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const SizedBox(height: 200),
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
                                
                MyButton(buttonText: 'Submit', onPressed: (){}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
