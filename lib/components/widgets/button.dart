import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  // properties for the button class
 final String buttonText;
 final Color? buttonColor;
 final Color? textColor;
 final VoidCallback onPressed;
 final EdgeInsets? padding;

  // initialising the properties
  const MyButton({
    
    super.key, 
    required this.buttonText, 
     this.buttonColor, 
     this.textColor,
     required this.onPressed,
     this.padding});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onPressed,
      
      style: ElevatedButton.styleFrom(
        padding: padding,
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
      child: Text(buttonText,
      style: TextStyle(
        color: textColor,
      ),
      ),
    );
  }
}