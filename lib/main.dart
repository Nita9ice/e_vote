
import 'package:e_vote/Services/authservices.dart';
import 'package:e_vote/providers/electionprovider.dart';

import 'package:e_vote/providers/userprofileprovider.dart';
import 'package:e_vote/screens/add_auditor.dart';
import 'package:e_vote/screens/change_password.dart';



import 'package:e_vote/screens/create_election.dart';
import 'package:e_vote/screens/edit_profile.dart';
import 'package:e_vote/screens/faq.dart';
import 'package:e_vote/screens/join_vote.dart';
import 'package:e_vote/screens/my_election.dart';
import 'package:e_vote/screens/profile_screen.dart';
import 'package:e_vote/screens/voter/voter.dart';
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
        ChangeNotifierProvider(create: (context) => Electionprovider()),
        ChangeNotifierProvider(create: (context)=>Userprofileprovider()),
     
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        // home: AddCandidateScreen(),




        // The first screen to display once the app is launch.

        initialRoute: '/',
        // Defining the varous screen routes
        routes: {
          '/': (context) => SplashScreen(),
          '/welcome': (context) => StreamBuilder(stream: Authservices().authChanges, builder:(context, snapShot){
            if(snapShot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            if(!snapShot.hasData){
            return WelcomeScreen();
            }
            return DashboardScreen();
          } ), // WelcomeScreen(),

          '/login': (context) => LoginScreen(),
          '/forgot': (context) => ForgotPasswordScreen(),
          '/signup': (context) => SignupScreen(),
          '/email': (context) => VerifyEmailScreen(),
          '/dashboard': (context) => DashboardScreen(),
          '/create': (context) => CreatElectionScreen(),
          '/candidate': (context) => AddCandidateScreen(),
          '/profile': (context) => ProfileScreen(),
          '/edit': (context) => EditProfile(),
          '/auditor': (context) => AddAuditorScreen(),
           '/faq': (context) => FaqScreen(),
          '/join': (context) => JoinVoteScreen(),
          '/voters': (context) => VoterScreen(),
           '/change': (context) => ChangePassword(),
           '/election': (context) => ElectionList()
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

