
import 'package:e_vote/Services/firestoreservices.dart';
import 'package:e_vote/components/utilities/app_dimension.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:e_vote/models/candidate.dart';

import 'package:flutter/material.dart';

// This code  displays the welcome screen of the app
class ElectionList extends StatefulWidget {
  const ElectionList({super.key});

  
 


  @override
  State<ElectionList> createState() => _ElectionListState();
}

class _ElectionListState extends State<ElectionList> {
  // List of candidates (now part of Election model, but managed locally until submit)
  List<Candidate> candidateList = [];
  @override
  Widget build(BuildContext context) {

// This is a  variable 'dims' that holds an AppDimensions object,
// which provides responsive sizing values based on the current context.
//final dims = AppDimensions(context);
final user = FirebaseAuth.instance.currentUser;
final dims = AppDimensions(context);

if(user == null){
  return Text('user not logged in');
}

    return Scaffold(

      body: Container(

        // Background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background2.jpg'),
            fit: BoxFit.cover, // Cover entire screen with background image
          ),
        ),
        child: Center(
          child: Column(
            children: [
             SizedBox(height: dims.heightPercent(5)), // Top spacing

                // Back button aligned to the top-left corner
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: dims.widthPercent(10), // Responsive size
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Navigate back
                    },
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.png', width: 100),
                    const Text(
                      'E-voting',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ],
                ),

const SizedBox(height: 100),
                Card(
                            color: Colors.grey[200],
                            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  Row(
                                                                      children: [
                                   Text(
                                     // Election Title
                                     'SUG Election Uniben',
                                     style: const TextStyle(
                                       fontSize: 20,
                                       fontWeight: FontWeight.w700,
                                     ),
                                   ),
                                  
                                  
                                   const Spacer(),
                                                      IconButton(
                                                        onPressed: () {
                                                          Navigator.pushNamed(context, '/board'); // Navigate to election board screen
                                                        },
                                                        icon: const Icon(
                                                          Icons.arrow_forward_ios,
                                                          color: Color.fromRGBO(0, 0, 0, 1),
                                                        ),
                                                      ),
                                  
                                   
                                                                      ],
                                                                    ),
                                ],
                              ),
                            ),
                          ),


                Expanded(
                      child: ListView.builder(
                        itemCount: candidateList.length,
                        itemBuilder: (context, index) {
                          final candidate = candidateList[index];
                          return  Card(
                            color: Colors.grey[200],
                            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      // candidate image
                                      '',
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  
                                  Row(
                                    children: [
                                      Text(
                                        // name of candidate
                                        '',
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),


                                      const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/edit'); // Navigate to edit profile
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),

                                      
                                    ],
                                  ),

                                  
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
             

             

             
            ],
          ),
        ),
      ),

    );
  }
}
