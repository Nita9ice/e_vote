import 'package:flutter/material.dart';

void main(){
  runApp(EVote());
}

class EVote extends StatelessWidget {
  const EVote({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}