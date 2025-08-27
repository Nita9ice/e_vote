import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:flutter/material.dart';

// Screen that displays a verification message after a user registers.
// Informs the user to check their email for a verification link and
// provides options to resend the email or navigate to login.

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  void dispose() {
    // Dispose resources if needed in the future
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
// This is a  variable 'dims' that holds an AppDimensions object,
// which provides responsive sizing values based on the current context.
    final dims = AppDimensions(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          //background image 
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            //horizontal padding (7.5% of screen width)
            padding: EdgeInsets.symmetric(horizontal: dims.widthPercent(7.5)),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Top spacing (28% of screen height)
                  SizedBox(height: dims.heightPercent(28)),

                  // Main heading text
                  Text(
                    'Verify Your Email',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: dims.fontSizeLarge, // Responsive large font
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),

                  // Spacing between heading and sub-text
                  SizedBox(height: dims.heightPercent(10)),

                  // Sub-text explaining the verification process
                  Text(
                    'A verification link has been sent to your email.\nPlease check your inbox/spam and click the link.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: dims.fontSizeMedium, // Responsive medium font
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),

                  // Spacing before resend option
                  SizedBox(height: dims.spacingLarge),

                  // Row for resend email option
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Didn\'t receive the email?',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: dims.fontSizeSmall,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          
                        },
                        child: Text(
                          'Resend',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: dims.fontSizeSmall,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //spacing before login option (20% of screen height)
                  SizedBox(height: dims.heightPercent(20)),

                  //login option after successful verification
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Please login to your account',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: dims.fontSizeSmall,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                      TextButton(
                        onPressed: () {

                          // Navigate to login screen

                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: dims.fontSizeSmall,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                    ],
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
