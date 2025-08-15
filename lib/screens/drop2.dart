  import 'package:flutter/material.dart';
  class Drop2 extends StatefulWidget {
  const Drop2({super.key});

  @override
  State<Drop2> createState() => _Drop2State();
}

class _Drop2State extends State<Drop2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
            child: Column(
              spacing: 20.0,
              children: [
                SizedBox(height: 100,),
                Padding(padding: const EdgeInsets.only(left: 30),
                 child: Row(
                   children: [
                         Row(
                              children: [
                              Icon(Icons.arrow_back, color: Colors.white,),
                             ],
                         ),
                   ],
                 ),
                ),
              
                
                Row(
                  children: [
                    Padding(padding: const EdgeInsets.all(16)),
                   Text('My Election',style: TextStyle(color: Colors.white, 
                   fontSize: 20 ,
                   fontFamily: 'Roboto',
                   fontWeight:FontWeight.w700,
                   ),
                   ),
                   ListView(

                   ),
                  ],
                  
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Image.asset(
                'assets/images/logo.jpg',
                width: 200,
              ),
              Text('E-voting',style: TextStyle(color: Colors.white,fontSize:25,
               fontWeight: FontWeight.w700,
              ),
              ),
                  ],
                )

              ],
            ),        
    ),

    );
  }
}