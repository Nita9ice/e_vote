import 'package:flutter/material.dart';


class AuditorAlertBox extends StatelessWidget {

  final Widget email;
  final Widget firstName;
  final Widget lastName;
  final Widget button;
  final Widget button2;
  

  const AuditorAlertBox({super.key, required this.email, required this.firstName, required this.lastName, required this.button, required this.button2});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
       backgroundColor: Colors.transparent,
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 300, // Reduced height since extraWidget is removed
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            
            
            SizedBox(height: 8),
            SizedBox(child: firstName),
            SizedBox(height: 12),
            SizedBox(child: lastName),
            SizedBox(height: 12),
            SizedBox(child: email),
            SizedBox(height: 20),
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