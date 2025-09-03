import 'dart:io';

import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:e_vote/models/auditor.dart';
import 'package:e_vote/models/candidate.dart';
import 'package:e_vote/models/election.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;


class ElectionBoard extends StatefulWidget {
const  ElectionBoard({super.key});

  @override
  State<ElectionBoard> createState() => _ElectionBoardState();
}

class _ElectionBoardState extends State<ElectionBoard> {
  // List of candidates (now part of Election model, but managed locally until submit)
//  List<Candidate> candidateList = [];

  // List of Auditors (managed locally until submit)
//  List<Auditor> auditorList = [];
late Election _election;

  @override
  void initState() {
    super.initState();
    // Added: Get Election from arguments
    WidgetsBinding.instance.addPostFrameCallback((_) {
     
      setState(() { _election = ModalRoute.of(context)!.settings.arguments as Election;}); // If needed to refresh
    });
  }
  

  @override
  Widget build(BuildContext context) {
    // Create an AppDimensions object for responsive sizing
    final dims = AppDimensions(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
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
                const SizedBox(height: 30),

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

                SizedBox(height: 70),
                Align(
                   alignment: Alignment.topLeft,
                  child:  Text(
                  
                    // This should carry the title of the election
                  _election.title,
                  
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(255, 255, 255, 1),
                  
                      // color: Color.fromRGBO(3, 58, 202, 1),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Container(
                  padding: EdgeInsets.all(16),
                  height: 100,
                  decoration: BoxDecoration(
                    // color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      // color: Color.fromRGBO(1, 20, 70, 1),
                      width: 2,
                    ),
                  ),
                  child: Text(
                    // This should carry the description of the election
                   _election.description,
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: null,
                    textAlign: TextAlign.center,
                    
                  ),
                ),


                SizedBox(
                  height: 200,width: 300,
                  child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _election.candidates?.length,
                            itemBuilder: (context, index) {
                              final candidate = _election.candidates?[index];
                              return Card(
                                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 220,
                    // maxHeight: 300,
                    minWidth: 160, // prevents card from collapsing too small
                    // maxWidth: 250, // prevents card from being too wide
                  ),
                  child: IntrinsicHeight(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // content defines height
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                  
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: candidate?.image != null
                                ? (kIsWeb
                                    ? MemoryImage(candidate?.image as Uint8List)
                                    : FileImage(candidate?.image as File))
                                : null,
                            child: candidate?.image == null
                                ? const Icon(Icons.person, size: 50)
                                : null,
                          ),
                  
                          const SizedBox(height: 8),
                          Flexible(
                            child: Text(
                              
                              '${candidate?.firstName} ${candidate?.lastName}',
                              
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2, // avoids overflow if name is long
                            ),
                          ),
                          Text(
                            'Votes: ${candidate?.voteCount}',
                            style: const TextStyle(fontSize: 14),
                          ),
                  
                          const SizedBox(height: 10),
                  
                        // for the auditorList 
                       

                           ],
                      ),
                    ),
                  ),
                                ),
                  
                              );
                            },
                          ),
                ),

// for the auditor
        
              SizedBox(
                        height: 200, width: 200,
                         child: ListView.builder(
                      
                       
                         // physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                              itemCount: _election.auditors?.length,
                              itemBuilder: (context, index) {
                                final auditor = _election.auditors?[index];
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 16,
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Stack(
                                    // Added: Stack for overlay icons
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${auditor?.firstName} ${auditor?.lastName}',
                                            style: const TextStyle(
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.black
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            'Email: ${auditor?.email}',
                                            style: const TextStyle(fontSize: 14, color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      
                                    ],
                                  ),
                                );
                              },
                            ),
                       ),],
            ),
          ),
        ),
      ),
    );
  }
}
