import 'package:flutter/material.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Extends the body behind the app bar for seamless background
        extendBodyBehindAppBar: true,

        // Transparent AppBar with custom icon styling
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
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all( 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 82,
                      height: 88,
                    ),
                    // const SizedBox(width: 12),
                    const SizedBox(width: 2),
                    const Text(
                      "Evote",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Center(
                  child: const Text(
                    textAlign: TextAlign.center,
                    "Frequently Asked  Questions(FAQ)",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  
                  ),
                ),
                 
          
          
                const SizedBox(height: 30),
          
                const Text(
                  textAlign: TextAlign.justify,
                  """1 - How to use E-VOTING? E-VOTING is an Internet voting app where you can run transparent and secure elections. To cast your vote in a given election, you need to have its unique voting link.
          
          
          2 - How to create Election? You can create and run many elections as an admin. You need to be logged in and identified as an admin in order to create and run elections. To create an election, get to the home page and click on ‘CREATE ELECTION’, then the appropriate page will come up and you will be required to fill some information about the elections and confirm the creation.
          
          
          3 - How to cast my vote? To cast your vote, you need to have first of all the voting link, click on the voting link to get a list of all the candidate for the election and make your choice by the click the empty cycle box and submit your vote
           """,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
          
                
              ]
            )                ),
        
            
          
        )
      ),
    );
  }
}
