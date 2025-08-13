import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:flutter/material.dart';
import 'package:e_vote/components/widgets/button.dart';


class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Instantiate AppDimensions
    final dimensions = AppDimensions(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: dimensions.widthPercent(7.5)), // ~32.25px
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: dimensions.heightPercent(28)), // ~260.96px
                  // Main text
                  Text(
                    'Verify Your Email',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: dimensions.widthPercent(8.4), // ~36.12px
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  SizedBox(height: dimensions.heightPercent(10.7)), // ~99.64px
                  // Sub text
                  Text(
                    'A verification link has been sent to your email.\nPlease check your inbox and click the link.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: dimensions.widthPercent(4.7), // ~20.21px
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  SizedBox(height: dimensions.heightPercent(7.5)), // ~69.90px
                  // Verified button
                  MyButton(
                    buttonText: 'Verified',
                    onPressed: () {},
                  ),
                  SizedBox(height: dimensions.heightPercent(2.2)), // ~20.50px
                  // Resend email button
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Didn\'t receive the email? Resend',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: dimensions.widthPercent(4.7), // ~20.21px
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(255, 255, 255, 1),
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