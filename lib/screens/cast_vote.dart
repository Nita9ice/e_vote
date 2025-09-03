import 'package:e_vote/components/widgets/button.dart';
import 'package:e_vote/models/ids.dart';
import 'package:flutter/material.dart';
import 'package:e_vote/components/widgets/text_field.dart';

// A StatefulWidget that provides a UI for casting a vote
// by collecting userId and electionId from the user.
class CastVote extends StatefulWidget {
  const CastVote({super.key});

  @override
  State<CastVote> createState() => _CastVoteState();
}

class _CastVoteState extends State<CastVote> {
  // Controller to capture the user's ID input
  final TextEditingController userIdController = TextEditingController();

  // Controller to capture the election ID input
  final TextEditingController eLctionIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              image: AssetImage(
                "assets/images/background2.jpg",
              ), // Background image
              fit: BoxFit.cover,
            ),
          ),

          // Adds padding around the content
          child: Padding(
            padding: const EdgeInsets.all(20),

            // Centers all content vertically and horizontally
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  // Title text
                  const Text(
                    "Cast Vote",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // TextField for userId input
                  MyTextField(
                    controller: userIdController,
                    hintText: "Enter userId",
                  ),

                  const SizedBox(height: 20),

                  // TextField for electionId input
                  MyTextField(
                    controller: eLctionIdController,
                    hintText: "Enter electionId",
                  ),

                  const SizedBox(height: 50),

                  // Submit button
                  MyButton(
                    buttonText: 'Submit',
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 50,
                    ),

                    // On press: navigates to '/voters' route
                    // and passes userId & electionId as arguments
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/voters',
                        
                        arguments: Ids(
                          userId: userIdController.text.trim(),
                          
                          electionId: eLctionIdController.text.trim(),
                        ),
                        
                      );
                    },
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
