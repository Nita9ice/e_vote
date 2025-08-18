import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:flutter/material.dart';

class AlertBox2 extends StatelessWidget {
  final String containerText;
  
  final Widget? circularAvatar;
  final Widget? textField1;
  final Widget? textField2;
  final Widget? button;
  final Widget? button2;
  
  const AlertBox2({super.key, required this.containerText, this.circularAvatar, this.textField1, this.textField2, this.button, this.button2, });

  @override
  Widget build(BuildContext context) {
    // Instantiate AppDimensions
    final dimensions = AppDimensions(context);
    return  AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 420,
        // width: 350,
        
        decoration: BoxDecoration(
          
          // color: Color.fromRGBO(1, 20, 70, 1),
      
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            Text(containerText,
            style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: dimensions.widthPercent(4.7), // ~20.21px
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                ),
            ),
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.transparent,
              child: circularAvatar,
            ), 
            SizedBox(height: 8,),
            SizedBox(
              child: textField1,
            ),
            SizedBox(height: 8,),
          SizedBox(
            child: textField2,
          ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: button,
              ),
              SizedBox(width: 5,),
              SizedBox(
                child: button2,
              ),
            ],
          )
      
          ],
        ),
      ),
    );
  }
}