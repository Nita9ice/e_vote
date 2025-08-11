
import 'package:flutter/material.dart';



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


                    
              ],
            ),
          ),
        ),
      ),
    );
  }
}