import 'package:e_vote/Services/firestoreservices.dart';
import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:e_vote/models/election.dart';

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
  //  List<Candidate> candidateList = [];
  @override
  Widget build(BuildContext context) {
    // This is a  variable 'dims' that holds an AppDimensions object,
    // which provides responsive sizing values based on the current context.
    //final dims = AppDimensions(context);
    final user = FirebaseAuth.instance.currentUser;
    final dims = AppDimensions(context);

    if (user == null) {
      return Text('user not logged in');
    }

    return Scaffold(
      body: StreamBuilder(
        stream: Firestoreservices().getElectionStream(user.uid),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapShot.hasError) {
            return Center(
              child: Text('error Loading data ${snapShot.hasError}'),
            );
          }
          final elections = snapShot.data ?? [];
          if (elections.isEmpty) {
            return Center(child: Text('no data found'));
          }
          return Container(
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

                  Expanded(
                    child: ListView.builder(
                      itemCount: elections.length,
                      itemBuilder: (context, index) {
                        final election = elections[index];
                        return Card(
                          color: Colors.grey[200],
                          margin: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      // Election Title
                                      election.title,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),

                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/board',
                                          arguments: Election(
                                            title: election.title,
                                            description: election.description,
                                            startDate: election.startDate,
                                            endDate: election.endDate,
                                            candidates: election.candidates,
                                            auditors: election.auditors
                                          ),
                                        ); // Navigate to eleection board screen
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.black,
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
          );
        },
      ),
    );
  }
}
