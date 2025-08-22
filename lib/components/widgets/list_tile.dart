import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Widget icon;
  const MyListTile({super.key, required this.text, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
leading: icon,
       title:  Text(text,
        style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  // color: Color.fromRGBO(3, 58, 202, 1),
                                  
                                ),
       ),
       onTap: onPressed,
    );
  }
}