

import 'package:flutter/material.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  
  @override
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/background1.jpg'))
       
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 400,),
              // Main text 
                Text('Welcome Onboard',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(255, 255, 255, 1,)
                ),
                ),

                

                IconButton(onPressed: (){

                   // Navigate to login password screen
                          Navigator.pushNamed(context, '/login');
                }, icon:Icon(Icons.arrow_circle_right_outlined,
                size: 100,
                ), ),


              Image.asset('assets/images/logo2.jpg',
              width: 200
              
             
              ),
              Text('E-Vote')
            ],
          ),
          
            
        ),

      )
    
      );
      
    
  }
}