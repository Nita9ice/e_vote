import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  // Properties for the button class
  final String buttonText;
  final Color? buttonColor;
 
  final VoidCallback onPressed;
  final EdgeInsets? padding;

  // Initializing the properties
  const MyButton({
    super.key,
    required this.buttonText,
    this.buttonColor,
    
    required this.onPressed,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    // Instantiate AppDimensions
    final dimensions = AppDimensions(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding ??
            EdgeInsets.symmetric(
              vertical: dimensions.heightPercent(1.5), // ~13.98px
              horizontal: dimensions.widthPercent(22), // ~94.60px
            ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(dimensions.widthPercent(4.7)), // ~20.21px
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            colors: [
              Color.fromRGBO(3, 58, 202, 1),
              Color.fromRGBO(132, 166, 255, 1),
            ],
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: dimensions.widthPercent(5.6), // ~24.08px
            fontWeight: FontWeight.w700,
            color:  const Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
      ),
    );
  }
}