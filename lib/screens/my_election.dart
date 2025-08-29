import 'package:e_vote/Services/firestoreservices.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// This code  displays the welcome screen of the app
class ElectionList extends StatelessWidget {
  const ElectionList({super.key});

  
 


  @override
  Widget build(BuildContext context) {

// This is a  variable 'dims' that holds an AppDimensions object,
// which provides responsive sizing values based on the current context.
//final dims = AppDimensions(context);
final user = FirebaseAuth.instance.currentUser;

if(user == null){
  return Text('user not logged in');
}

    return Scaffold(
      body: StreamBuilder(stream: Firestoreservices().getElectionStream(user.uid), builder: (context, snapshot){
      if(snapshot.connectionState == ConnectionState.waiting){
        return CircularProgressIndicator.adaptive();
      }
      if(snapshot.hasError){
        return Text('error loading data ${snapshot.error}');
      }
      final elections = snapshot.data?? [];
      if(elections.isEmpty){
        return Text('No data found');
      }
      return ListView.builder(itemCount: elections.length,itemBuilder: (context, index){
        final election = elections[index]; 
        return

        Container(child: Column(children: [Text(election.description),],),);



      });


      }) , 
    );
  }
}
