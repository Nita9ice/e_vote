import 'package:flutter/material.dart';
import 'package:e_vote/components/utilities/app_dimension.dart';

// A reusable custom text field widget with a gradient border and 
// rounded corners. 
// It supports:
// - A controller to manage input text.
// - A hint text for placeholder guidance.
// - Optional password obscuring (obscureText).
// - An optional suffix icon (e.g., for toggling password visibility).
// Styling (font sizes, spacing, radius) is responsive using AppDimensions
// for consistent scaling across different screen sizes.

class MyTextField extends StatelessWidget {
// Properties of the class

  // Controller for managing the input text
  final TextEditingController controller;

  // Text that appears as a hint (placeholder) inside the text field
  final String hintText;

  // Determines whether the text should be obscured (e.g., for passwords)
  final bool obscureText;

  // Optional widget displayed at the end of the text field (e.g., eye icon)
  final Widget? suffixIcon;

  // Optional (to display a helper text in the text field)
  final String? helperText;

  // Constructor for initializing the properties
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon, this.helperText,
  });

  @override
  Widget build(BuildContext context) {
// This is a  variable 'dims' that holds an AppDimensions object,
// which provides responsive sizing values based on the current context.
    final dims = AppDimensions(context);

    return Container(
      // Outer container with gradient background and rounded corners
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(dims.widthPercent(5)), 
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(1, 20, 70, 1), 
            Color.fromRGBO(132, 166, 255, 1), 
          ],
        ),
      ),
      child: Container(
        // Inner container to create spacing between gradient and text field
        margin: EdgeInsets.all(dims.widthPercent(0.8)), 
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1), 
          borderRadius: BorderRadius.circular(dims.widthPercent(5)),
        ),
        child: TextField(
          controller: controller, // Links the input field with its controller
          obscureText: obscureText, // Obscure text if true
          enabled: true, 
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: dims.fontSizeSmall, // Responsive font size
            fontWeight: FontWeight.w400, 
            color: const Color.fromRGBO(0, 0, 0, 1), 
          ),
          decoration: InputDecoration(
            helperText: helperText,
            hintText: hintText, // Display hint text inside the field
            hintStyle: TextStyle(
              fontFamily: 'Roboto',
              fontSize: dims.fontSizeSmall, // Responsive font size
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(0, 0, 0, 1), 
            ),
            suffixIcon: suffixIcon, // Optional icon (e.g., password toggle)
            filled: true,
            fillColor: Colors.transparent, 
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(dims.widthPercent(5)),
              borderSide: BorderSide(width: dims.widthPercent(0.8)), 
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: dims.widthPercent(4), // Responsive left-right padding
              vertical: dims.heightPercent(1.5), // Responsive top-bottom padding
            ),
          ),
        ),
      ),
    );
  }
}
