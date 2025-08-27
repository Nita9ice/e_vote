import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:e_vote/components/widgets/button.dart';
import 'package:flutter/material.dart';


// This class is create to determine the status of the user vote, whether it is successful or not
class AlertBoxStatus extends StatelessWidget {
  final String containerText;
  final Image containerImage;
  final double? imageHeight;
  final double? imageWidth;
  final VoidCallback onPressed;
  
  
  
  
  
  const AlertBoxStatus({super.key, required this.containerText,  required this.containerImage, this.imageHeight, this.imageWidth, required this.onPressed, });

  @override
  Widget build(BuildContext context) {
    // Instantiate AppDimensions
    final dimensions = AppDimensions(context);
    return  AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        padding: EdgeInsets.all(32),
        height: 348,
        width: 372,
        decoration: BoxDecoration(
          
          // color: Color.fromRGBO(1, 20, 70, 1),
      
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            SizedBox(
              height: imageHeight,
              width: imageWidth,
              child: containerImage),
            Text(containerText,
            style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: dimensions.widthPercent(8.4), // ~36.12px
                        fontWeight: FontWeight.w700,
                        // color: const Color.fromRGBO(255, 255, 255, 1),
                      ),),
            SizedBox(height: 10,),
      
            MyButton(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              buttonText: 'Ok', onPressed: onPressed)
            
          ],
        ),
      ),
    );
  }
}