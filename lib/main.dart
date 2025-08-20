// import 'package:e_vote/screens/register.dart';

import 'package:e_vote/providers/candidatelistprovider.dart';
import 'package:e_vote/screens/add_auditor.dart';

//import 'package:e_vote/screens/unused_file.dart/create-election.dart';

import 'package:e_vote/screens/create_election.dart';
import 'package:e_vote/screens/faq.dart';
import 'package:provider/provider.dart';

import 'package:e_vote/screens/add_candidate.dart';
import 'package:e_vote/screens/dashboard.dart';
import 'package:e_vote/screens/forgot_password.dart';


import 'package:e_vote/screens/splash.dart';
import 'package:e_vote/screens/login.dart';
import 'package:e_vote/screens/signup.dart';
import 'package:e_vote/screens/verify_email.dart';
import 'package:e_vote/screens/welcome.dart';
import 'package:e_vote/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:e_vote/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(EVote());
}

class EVote extends StatelessWidget {
  const EVote({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Candidatelistprovider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        

      
     


      
      // home: VerifyEmailScreen(),


      

        // The first screen to display once the app is launch.
        initialRoute: '/',

        // Defining the varous screen routes
        routes: {
          '/': (context) => SplashScreen(),
          '/welcome': (context) => WelcomeScreen(),
          '/login': (context) => LoginScreen(),
          '/forgot': (context) => ForgotPasswordScreen(),
          '/signup': (context) => SignupScreen(),
          '/email': (context) => VerifyEmailScreen(),
          '/admin': (context) => DashboardScreen(),
          '/create': (context) => CreatElectionScreen(),
          '/candidate': (context) => AddCandidateScreen(),
          '/faq': (context) => FaqScreen(),
          '/auditor': (context) => AddAuditorScreen()

        },


      

  

      

        // Theme data for the App

        // this is the default theme based on the device theme
        themeMode: ThemeMode.system,

        // light theme
        theme: AppTheme.lightTheme,
        // dark theme
        darkTheme: AppTheme.darkTheme,
      ),
    );
  }
}