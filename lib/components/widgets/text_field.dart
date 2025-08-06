import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  // properties for this class
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final VoidCallback onPressed;
 
  

  // initializing the properties of the class
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false, required this.onPressed,
   
    
    
  });

  @override
  Widget build(BuildContext context) {
    
   
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
      
            Color.fromRGBO(1, 20, 70, 1),
            Color.fromRGBO(132, 166, 255, 1)
            
          ])
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(1, 20, 70, 1),
           
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            enabled: true,
            style: TextStyle(
              
                 
            ),
            decoration: InputDecoration(
              hintText: hintText,
              
              hintStyle: GoogleFonts.roboto(
                fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1,)
                
          
              ),
              filled: true,
              fillColor: Color.fromRGBO(255,255, 255, 1),
              
                 
              
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  width: 3,
                  
          
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
