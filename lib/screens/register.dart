
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
         width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/background2.jpg'),
              fit: BoxFit.cover)
            ),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              
              children: [
                // space
                SizedBox(height: 241,),

                // Main text 
                Text('Register',
                style: GoogleFonts.roboto(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(255, 255, 255, 1,)
                ),
                
                ),
                // space
                SizedBox(height: 29,),
                Image.asset('assets/images/image1.jpg',
                height: 162,
                width: 162,
                ),
                

// space
                SizedBox(height: 29,),
                 Text('Admin',
                style: GoogleFonts.roboto(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(255, 255, 255, 1,)
                ),
                ),
                // space
                SizedBox(height: 41,),

                Image.asset('assets/images/image2.jpg'),
                // space
                SizedBox(height: 29,),

                 Text('User',
                style: GoogleFonts.roboto(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(255, 255, 255, 1,)
                ),
                ),


                    
              ],
            ),
          ),
        ),
      ),
    );
  }
}