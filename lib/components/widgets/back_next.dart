import 'package:e_vote/components/widgets/button.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BackNextButton extends StatefulWidget {
  final String? text;
  final VoidCallback onPressed;
  final VoidCallback onPressed1;
  const BackNextButton({super.key, required this.onPressed, this.text, required this.onPressed1});

  @override
  State<BackNextButton> createState() => _BackNextButtonState();
}

class _BackNextButtonState extends State<BackNextButton> {


  @override
  Widget build(BuildContext context) {
    return  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                      MyButton(buttonText: 'Back', onPressed:widget.onPressed1
                                       
                                     
                                      ,
                                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                      ),
                                      MyButton(buttonText:widget.text?? 'Next', onPressed: widget.onPressed,
                                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                      ),
                                    ],
                                  );
  }
}