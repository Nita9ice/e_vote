import 'package:flutter/material.dart';

class CandidateAlertBox extends StatelessWidget {
  final String containerText;
  final Widget? circularAvatar;
  final Widget? textField1;
  final Widget? textField2;
  final Widget? button;
  final Widget? button2;
  final VoidCallback? onPickImage; // Callback for the plus icon

  const CandidateAlertBox.CandidateAlertBox({
    super.key,
    required this.containerText,
    this.circularAvatar,
    this.textField1,
    this.textField2,
    this.button,
    this.button2,
    this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    // Instantiate AppDimensions
    // final dimensions = AppDimensions(context);
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 420, // Reduced height since extraWidget is removed
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            // Text(
            //   containerText,
            //   style: TextStyle(
            //     fontFamily: 'Roboto',
            //     fontSize: 24,
            //     fontWeight: FontWeight.w700,
            //     color: Color.fromRGBO(3, 58, 202, 1),
            //   ),
            // ),
            // SizedBox(height: 8),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.transparent,
                  child: circularAvatar,
                ),
                if (onPickImage != null)
                  Positioned(
                    bottom: -5, // Adjust to place icon closely beside avatar
                    child: IconButton(
                      
                      iconSize: 32,
                      onPressed: onPickImage,
                      icon: Icon(
                        Icons.add_circle,
                        color: Color.fromRGBO(3, 58, 202, 1),
                        size: 40,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 8),
            SizedBox(child: textField1),
            SizedBox(height: 8),
            SizedBox(child: textField2),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(child: button),
                SizedBox(width: 5),
                SizedBox(child: button2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}