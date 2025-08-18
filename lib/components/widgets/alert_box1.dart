import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:flutter/material.dart';

class AlertBox1 extends StatelessWidget {
  final String containerText;
  final Image containerImage;
  final double? imageHeight;
  final double? imageWidth;
  
  
  
  
  
  const AlertBox1({super.key, required this.containerText,  required this.containerImage, this.imageHeight, this.imageWidth, });

  @override
  Widget build(BuildContext context) {
    // Instantiate AppDimensions
    final dimensions = AppDimensions(context);
    return  Container(
      padding: EdgeInsets.all(32),
      height: 348,
      width: 372,
      decoration: BoxDecoration(
        
        color: Color.fromRGBO(1, 20, 70, 1),

        // color: Color.fromRGBO(0, 255, 0, 1),
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
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),),
          SizedBox(height: 10,),
          
        ],
      ),
    );
  }
}