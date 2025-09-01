
import 'package:flutter/material.dart';

class CandidateAlertBox extends StatefulWidget {
  final String containerText;
  final Widget? circularAvatar;
  final Widget? textField1;
  final Widget? textField2;
  final Widget? button;
  final Widget? button2;
  final VoidCallback? onPickImage; // Callback for the plus icon

  const CandidateAlertBox({
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
  State<CandidateAlertBox> createState() => _CandidateAlertBoxState();
}

class _CandidateAlertBoxState extends State<CandidateAlertBox> {
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
                  child: widget.circularAvatar,
                ),
                if (widget.onPickImage != null)
                  Positioned(
                    bottom: -5, // Adjust to place icon closely beside avatar
                    child: IconButton(
                      
                      iconSize: 32,
                      onPressed: widget.onPickImage,
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
            SizedBox(child: widget.textField1),
            SizedBox(height: 8),
            SizedBox(child: widget.textField2),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(child: widget.button),
                SizedBox(width: 5),
                SizedBox(child: widget.button2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}