import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const AddButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
     // Instantiate AppDimensions
    final dimensions = AppDimensions(context);
    return Container(
                  height: 69,
                  width: 226,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      colors: [
                        Color.fromRGBO(132, 166, 255, 1),
                        Color.fromRGBO(134, 138, 148, 1),
                      ],
                    ),
                  ),
        
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: dimensions.widthPercent(4.7),
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      IconButton(
                        onPressed: onPressed,
                        icon: Icon(
                          Icons.add_box,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                );
  }
}