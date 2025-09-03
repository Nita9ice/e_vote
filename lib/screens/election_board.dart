import 'dart:io';
import 'package:e_vote/models/election.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;


class ElectionBoard extends StatefulWidget {
const  ElectionBoard({super.key});

  @override
  State<ElectionBoard> createState() => _ElectionBoardState();
}

class _ElectionBoardState extends State<ElectionBoard> {
 
//  List<Auditor> auditorList = [];
late Election _election;
 bool _inits = false;

@override
 
void didChangeDependencies() {
  super.didChangeDependencies();
  if(!_inits){

    _election = ModalRoute.of(context)!.settings.arguments as Election;
   _inits =true;
  }
  
}



  // @override
  // void initState() {
  //   super.initState();
  //   // Added: Get Election from arguments
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
     
  //     setState(() { _election = ModalRoute.of(context)!.settings.arguments as Election;}); // If needed to refresh
  //   });
  // }
  

  @override
  Widget build(BuildContext context) {
    
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
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
               
                children: [
                  const SizedBox(height: 100),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/logo.png', width: 100),
                      const Text(
                        'E-voting',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ],
                  ),
              
                  SizedBox(height: 30),
                  Text(
                  
                    // This should carry the title of the election
                  _election.title,
                  textAlign: TextAlign.center,
                  
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(255, 255, 255, 1),
                  
                        
                    ),
                  ),
              
                  SizedBox(height: 5),
              
                  Text(
                    // This should carry the description of the election
                   _election.description,
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: null,
                    textAlign: TextAlign.center,
                    
                  ),

                  SizedBox(height: 20),

                  Text(
                    // This should carry the election ID
                  'Election ID: ${_election.ids?.electionId??''}',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: null,
                    textAlign: TextAlign.center,
                    
                  ),


                  Text(
                    // This should carry the voter ID
                   "User Id:${_election.ids?.userId??''}",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: null,
                    textAlign: TextAlign.center,
                    
                  ),
              
                  SizedBox(height: 30),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Align(
                        alignment: Alignment.topLeft,
                        child: Text('Candidates',
                         style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 24,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                                    
                                    
                                    
                      SizedBox(
                        height: 250,
                        
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
                          
                          minWidth: 160, // prevents card from collapsing too small
                         
                        ),
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
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2, // avoids overflow if name is long
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Votes: ${candidate?.voteCount}',
                                style: const TextStyle(fontSize: 14,
                                fontWeight: FontWeight.w400,
                                 color: Colors.black,
                                    
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
                                    
                      const SizedBox(height: 50),
                                    
                                    // List view builder for auditors
                                    
                                    
                          Align(
                        alignment: Alignment.topLeft,
                        child: Text('Auditors',
                         style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 24,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                                      SizedBox(
                              height: 300, 
                               child: ListView.builder(
                                padding: EdgeInsets.zero, 
                                shrinkWrap: true,
                                    itemCount: _election.auditors?.length,
                                    itemBuilder: (context, index) {
                                      final auditor = _election.auditors?[index];
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 8,
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
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20,
                                                    color: Colors.black
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  '${auditor?.email}',
                                                  style: const TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w700,),
                                                ),
                                              ],
                                            ),
                                            
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                             ),
                             SizedBox(height: 50),
                        ],
                      ),
                    ),
                  )
              
                 ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}