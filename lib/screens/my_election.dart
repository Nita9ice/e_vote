import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:flutter/material.dart';

// This code  displays the welcome screen of the app
class ElectionList extends StatelessWidget {
  const ElectionList({super.key});

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
              // Add vertical spacing equal to 45% of screen height
              SizedBox(height: dims.heightPercent(45)),

             

             

             
            ],
          ),
        ),
      ),
    );
  }
}
