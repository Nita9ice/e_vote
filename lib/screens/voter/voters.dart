import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:e_vote/components/widgets/button.dart';
import 'package:e_vote/models/candidate.dart';
import 'package:e_vote/models/election.dart';
import 'package:flutter/material.dart';

// This code  displays the welcome screen of the app
class VoterScreen extends StatefulWidget {
  const VoterScreen({super.key});

  @override
  State<VoterScreen> createState() => _VoterScreenState();
}

class _VoterScreenState extends State<VoterScreen> {
  late Election election;

 

  int? _selectedCandidateIndex; // Track selected candidate (null = none selected)

  // List of candidates (now part of Election model, but managed locally until submit)
  List<Candidate> candidateList = [];

  // Validate vote selection
  String? validateVote() {
    if (_selectedCandidateIndex == null) {
      return 'Please select a candidate';
    }
    return null;
  }

  // Mock vote submission (replace with actual DB/API logic)
  bool submitVote() {
    final error = validateVote();
    if (error != null) {
      return false;
    }

    // Simulate saving vote by incrementing voteCount
    setState(() {
      election.candidates?[_selectedCandidateIndex!].voteCount += 1;
    });

    // print(
    //     'Vote submitted for: ${election.candidates[_selectedCandidateIndex!].firstName} ${election.candidates[_selectedCandidateIndex!].lastName}');
    return true;
  }
  @override
  Widget build(BuildContext context) {

// This is a  variable 'dims' that holds an AppDimensions object,
// which provides responsive sizing values based on the current context.
final dims = AppDimensions(context);


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
          child: Padding(
            padding: const EdgeInsets.all(24),
            
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
                  const SizedBox(height: 20),

                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text('Cast Your Vote',
                            
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      // color: Color.fromRGBO(3, 58, 202, 1),
                                      
                                    ),
                                    ),
                  ),
                  const SizedBox(height: 20),
                    
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                     children: [
               
                    Image.asset(
                   'assets/images/logo.png',
                   width: 100,
                 ),
                 const Text('E-voting',
                 
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  // color: Color.fromRGBO(3, 58, 202, 1),
                                  
                                ),
                 ),
                 
                 ],
                     
                     ),
                     
                   
                  const SizedBox(height: 30,),

// implement the title from firebase
                  Text('The title of the election',
                  style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  // color: Color.fromRGBO(3, 58, 202, 1),
                                  
                                ),
                  ),

                  const SizedBox(height: 10,),

                  Text('Select your prefer candidate',
                  style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  // color: Color.fromRGBO(3, 58, 202, 1),
                                  
                                ),),

const SizedBox(height: 50,),
                               
            
            
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
                                  
                                  Column(
                                    children: [
                                      Text(
                                        // name of candidate
                                        '',
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Checkbox(
                                    value: _selectedCandidateIndex == index,
                                    onChanged: (bool? value){
                                       setState(() {
                                            _selectedCandidateIndex =
                                                value == true ? index : null;
                                          });
                                    },
                                    )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            
               
            MyButton(buttonText: 'Sumbit', onPressed: submitVote)
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
