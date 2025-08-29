
import 'dart:io';


import 'package:e_vote/models/election.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class VoterScreen extends StatefulWidget {
  const VoterScreen({super.key});

  @override
  State<VoterScreen> createState() => _VoterScreenState();
}

class _VoterScreenState extends State<VoterScreen> {
  
   Election? _election;
  int? _selectedCandidateIndex; // Tracks the selected candidate (single-selection)


  
      
  
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height:100,),
                             Align(
                              alignment: Alignment.topLeft,
                              child: Icon(Icons.arrow_back,color: Colors.white,
                              size: 30,
                              )),

                              Align(
                                alignment: Alignment.topLeft,
                                child: const Text("Cast Your Vote",style: TextStyle(color: Colors.white,
                                                   fontFamily: 'Roboto',
                                                   fontSize: 32,
                                                   fontWeight: FontWeight.w700,
                                                   ),
                                                   ),
                              ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 100,
                    ),
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
                const SizedBox(height: 20),

                // This text widget will carry the title info from the election model
                Text("",style: TextStyle(color: Colors.white,
                                                   fontFamily: 'Roboto',
                                                   fontSize: 32,
                                                   fontWeight: FontWeight.w700,
                                                   ),
                                                   ),
                const SizedBox(height: 20),

                 // This text widget will carry the description info from the election model
                Text("",style: TextStyle(color: Colors.white,
                                                   fontFamily: 'Roboto',
                                                   fontSize: 32,
                                                   fontWeight: FontWeight.w700,
                                                   ),
                                                   ),
                // Candidate list with checkboxes
                  Expanded(
                    child: _election?.candidates == null? 
                        const Center(
                            child: Text(
                              'No candidates available',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: _election?.candidates?.length,
                            itemBuilder: (context, index) {
                              final candidate = _election?.candidates?[index];
                              return Card(
                                color: Colors.white.withAlpha(100),
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Candidate image
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: candidate?.image != null
                                            ? kIsWeb
                                                ? Image.memory(
                                                    candidate?.image as Uint8List,
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context, error, stackTrace) {
                                                      debugPrint('Image load error: $error');
                                                      return Image.asset(
                                                        'assets/images/placeholder.jpg',
                                                        width: 60,
                                                        height: 60,
                                                        fit: BoxFit.cover,
                                                      );
                                                    },
                                                  )
                                                : Image.file(
                                                    candidate?.image as File,
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context, error, stackTrace) {
                                                      debugPrint('Image load error: $error');
                                                      return Image.asset(
                                                        'assets/images/placeholder.jpg',
                                                        width: 60,
                                                        height: 60,
                                                        fit: BoxFit.cover,
                                                      );
                                                    },
                                                  )
                                            : Image.asset(
                                                'assets/images/placeholder.jpg',
                                                width: 60,
                                                height: 60,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                      const SizedBox(width: 12),

                                      // Candidate details
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${candidate?.firstName} ${candidate?.lastName}',
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            Text(
                                              'Votes: ${candidate?.voteCount}',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Checkbox for voting
                                      Checkbox(
                                        value: _selectedCandidateIndex == index,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _selectedCandidateIndex = value == true ? index : null;
                                          });
                                        },
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
      ),
    );
  }
}