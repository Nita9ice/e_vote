import 'package:e_vote/Services/firestoreservices.dart';
import 'package:e_vote/models/election.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



// This code  displays the various election created by the user
class ElectionList extends StatefulWidget {
  const ElectionList({super.key});

  @override
  State<ElectionList> createState() => _ElectionListState();
}

class _ElectionListState extends State<ElectionList> {
  

  @override
  Widget build(BuildContext context) {
    
    final user = FirebaseAuth.instance.currentUser;
   

    if (user == null) {
      return Text('user not logged in');
    }

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(
              size: 40,
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
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
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: Column(
                    children: [
                      
                      const SizedBox(height: 100),
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
                       const SizedBox(height: 50),
                
                      
                
                     
                
                      Expanded(
                        child: ListView.builder(
                          itemCount: elections.length,
                          itemBuilder: (context, index) {
                            final election = elections[index];
                            return Card(
                              color: Colors.grey[200],
                              margin: const EdgeInsets.symmetric(
                                vertical: 8,
                                // horizontal: 16,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  children: [
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
                                            Navigator.pushNamed(
                                              context,
                                              '/board',
                                              arguments: Election(
                                                ids: election.ids,
                                                title: election.title,
                                                description: election.description,
                                                startDate: election.startDate,
                                                endDate: election.endDate,
                                                candidates: election.candidates,
                                                auditors: election.auditors
                                              ),
                                            ); // Navigate to election board screen
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
