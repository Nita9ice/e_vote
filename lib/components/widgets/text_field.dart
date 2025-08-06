import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  // properties for this class
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? enabled;
  final Color? fillColor;
  final Color? focusColor;
  final Color? hoverColor;

  // initializing the properties of the class
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.enabled,
    this.fillColor, 
    this.prefixIcon, 
    this.focusColor, 
    this.hoverColor
    
  });

  @override
  Widget build(BuildContext context) {
    
   
    return TextField(
      controller: controller,
      obscureText: obscureText,
      enabled: enabled,
      style: TextStyle(
        
           
      ),
      decoration: InputDecoration(
        hintText: hintText,
        focusColor: focusColor,
        hoverColor: hoverColor,
        hintStyle: TextStyle(
          
        ),
        filled: true,
        fillColor: fillColor,
        
           
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
