import 'package:e_vote/components/widgets/button.dart';
import 'package:flutter/material.dart';

class BackNextButton extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  const BackNextButton({super.key, required this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyButton(buttonText: 'Back', onPressed: (){
                                         Navigator.pop(context);
                                      },
                                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                      ),
                                      MyButton(buttonText:text?? 'Next', onPressed: onPressed,
                                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                      ),
                                    ],
                                  );
  }
}