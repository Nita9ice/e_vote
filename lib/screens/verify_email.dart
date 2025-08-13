import 'package:e_vote/components/widgets/button.dart';
import 'package:flutter/material.dart';


class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
 

  
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
     
      body: SafeArea(
        child: Container(
          width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/background2.jpg'),
              fit: BoxFit.cover)
            ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 260),
                        
                  // Main text
                  Text(
                    'Verify Your Email',
                     style: TextStyle(
                   fontFamily: 'Roboto',
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(255, 255, 255, 1,)
                ),
                   
                  ),
                  const SizedBox(height: 100),
                        
                  // sub text
                  Text(
                    'A verification link has been sent to your email.\nPlease check your inbox and click the link.',
                    
                    textAlign: TextAlign.center,
                    style: TextStyle(
                   fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(255, 255, 255, 1,)
                ),

                  ),
                  const SizedBox(height: 70),
                        
                   MyButton(
                        buttonText: 'Verified',
                        onPressed: (){}
                      ),
                  const SizedBox(height: 20),
                        
                  // button that resend email if previous email was not receive
                  TextButton(
                    onPressed: (){},
                    child: Text(
                      'Didn\'t receive the email? Resend',
                      style: TextStyle(
                   fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(255, 255, 255, 1,)
                ),
                      
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
