
import 'package:flutter/material.dart';

// This class is used as textfield when a user want to create an election
class TextField2 extends StatelessWidget {
  final String text;
  final String? text1;
  final String? text2;
  final TextEditingController controller;
  final TextEditingController? controller1;
  final TextEditingController? controller2;
  const TextField2({super.key, required this.text, required this.controller, this.text1, this.text2, this.controller1, this.controller2});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 20,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                  ),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 2,
                                        color:Color.fromRGBO(255, 255, 255, 1), ),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    hintText: text,
                                    
                                    
                                    hintStyle: TextStyle(
                                      
                               
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(96, 96, 96, 1),
                                  // color: Color.fromRGBO(1, 20, 70, 1),
                                  
                                
                                    ),
                                    
                                  ),
                                  
                                );
  }
}