import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:flutter/material.dart';

// This code  displays the welcome screen of the app
class AuditScreen extends StatelessWidget {
  const AuditScreen({super.key});

  @override
  Widget build(BuildContext context) {

// This is a  variable 'dims' that holds an AppDimensions object,
// which provides responsive sizing values based on the current context.
final dims = AppDimensions(context);


    return Scaffold(
      body: Container(

        // Background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background2.jpg'),
            fit: BoxFit.cover, // Cover entire screen with background image
          ),
        ),
        child: Center(
          child: Column(
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

             

             

             
            ],
          ),
        ),
      ),
    );
  }
}
