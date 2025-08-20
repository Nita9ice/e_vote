// lib/components/widgets/text_field.dart
import 'package:flutter/material.dart';

// This class is used as text field during login and sign up 

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
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
        margin: const EdgeInsets.all(3), // Border width (adjust as per Figma)
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1), // Inner fill color
          borderRadius: BorderRadius.circular(20), // Inner radius = outer radius - border width
        ),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          enabled: true,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: Colors.transparent, // Transparent to show inner Container's color
            border: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 3), // No solid border to avoid overlap
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ),
    );
  }
}