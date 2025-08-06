import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 94),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          colors: [

          Color.fromRGBO(3, 58, 202, 1),
          
          Color.fromRGBO(132, 166, 255, 1)
          
        ]
        
        )
        
      ),
      child: Text(buttonText,
     style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(255, 255, 255, 1,)
                ),
      ),
    );
  }
}