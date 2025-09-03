import 'package:e_vote/Services/firestoreservices.dart';
import 'package:e_vote/models/election.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// This widget displays the list of elections created by the logged-in user
class ElectionList extends StatefulWidget {
  const ElectionList({super.key});

  @override
  State<ElectionList> createState() => _ElectionListState();
}

class _ElectionListState extends State<ElectionList> {
  @override
  Widget build(BuildContext context) {
    // Get the currently authenticated user
    final user = FirebaseAuth.instance.currentUser;

    // If user is not logged in, display a message
    if (user == null) {
      return const Text('user not logged in');
    }

    return SafeArea(
      child: Scaffold(
        // Extend body behind app bar for seamless background
        extendBodyBehindAppBar: true,

        // Transparent app bar with custom icon styling
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            size: 40,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),

        // Listen to the Firestore stream of elections for the logged-in user
        body: StreamBuilder(
          stream: Firestoreservices().getElectionStream(user.uid),
          builder: (context, snapShot) {
            // Show loading indicator while fetching data
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            // Show error message if something goes wrong
            if (snapShot.hasError) {
              return Center(
                child: Text('error Loading data ${snapShot.hasError}'),
              );
            }

            // Retrieve elections from snapshot
            final elections = snapShot.data ?? [];

            // Show message if no elections exist
            if (elections.isEmpty) {
              return const Center(child: Text('no data found'));
            }

            // If elections are available, display them
            return Container(
              // Background image for the page
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background2.jpg'),
                  fit: BoxFit.cover, // Cover entire screen with background image
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 100),

                      // Logo and page title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/logo.png', width: 100),
                          const Text(
                            'My Election',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // List of elections
                      Expanded(
                        child: ListView.builder(
                          itemCount: elections.length,
                          itemBuilder: (context, index) {
                            final election = elections[index];

                            return Card(
                              
                              color: Colors.grey[200],
                              margin: const EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    // Display election title and forward button
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          flex: 3,
                                          child: Text(
                                            election.title,
                                            overflow: TextOverflow.fade,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            // Navigate to election board screen with election details
                                            Navigator.pushNamed(
                                              context,
                                              '/board',
                                              arguments: Election(
                                                title: election.title,
                                                description: election.description,
                                                startDate: election.startDate,
                                                endDate: election.endDate,
                                                candidates: election.candidates,
                                                auditors: election.auditors,
                                              ),
                                            );
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
              ),
            );
          },
        ),
      ),
    );
  }
}
