import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:flutter/material.dart';

class AdminContainer extends StatelessWidget {
  final Image containerImage;
  final String containerText;
  final double imageHeight;
  final double imageWidth;
  const AdminContainer({super.key, required this.containerImage, required this.containerText, required this.imageHeight, required this.imageWidth});

  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions(context);
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      height: 180,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            colors: [
              Color.fromRGBO(3, 58, 202, 1),
              Color.fromRGBO(132, 166, 255, 1),
            ],
          ),
      ),
      child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 25,),
           SizedBox(
            height: imageHeight,
            width: imageWidth,
            child: containerImage),
        
           SizedBox(height: 9,),
        
           Text(containerText,
           textAlign: TextAlign.center,
           style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: dimensions.widthPercent(4.7), // ~20.21px
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
           )
        
          ],
        ),
      ) ,
    );
  }
}