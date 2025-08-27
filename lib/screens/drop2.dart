  import 'package:cloud_firestore/cloud_firestore.dart';
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
          child: SafeArea(
            child: Column(
                children: [
                   SizedBox(height: 100,),
                         Padding(padding: EdgeInsetsGeometry.only(left:39 ),
                        
                   child: Row(
                    children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),      
                    SizedBox(height: 100,)
                    ],
                   ),
                  
                   ),

                   Padding(padding: EdgeInsetsGeometry.only(left:39 ),
                         child:  Row(
                   children: [
                     Text("My Election",style: TextStyle(color: Colors.white,
                     fontFamily: "Roboto",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                     ),
                     ),
                   ],
                   ),
                    
                           
                   ),
                 Padding(padding: EdgeInsets.only(left: 0),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                   Image.asset(
                  'assets/images/logo.jpg',
                  width: 100,
                ),
                Text('E-voting',style: TextStyle(color: Colors.white,fontSize:20),
                ),
                ],
                  
                     ),
                   ),
Card(
  elevation: 2,
  margin: EdgeInsets.symmetric(vertical: 8.0),
  child: Container(
    decoration: BoxDecoration(
color:Color.fromRGBO(144, 155, 184, 1),
   border: Border.all(
    color:Colors.grey,
    width: 1.5,
   ),
   borderRadius: BorderRadius.circular(8.0)
    ),
    child: ListTile(
      leading:      Icon(Icons.download,color: Colors.black,weight:700,size: 27,),
      title: Text("STUDENTS UNION GOVERNMENT ELECTION",
          style: TextStyle
      (fontWeight: FontWeight.w700,
        fontSize: 20,
        fontFamily: "Roboto",
        color: Colors.black,
      ),
      ),
      subtitle: Text("Choose the members of the SUG for the next academic year",
         style: TextStyle
      (fontWeight: FontWeight.w700,
        fontSize: 15,
        fontFamily: "Roboto",
        
      ),),
  //  onTap: () {},
      trailing:
      Icon(Icons.arrow_forward_ios),  
      onTap: () {
    // Action when the ListTile is tapped
    print('ListTile tapped!');
  },  
    ),
  ),
),    
Card(
  elevation: 2,
  margin: EdgeInsets.symmetric(vertical: 8.0),
  child: Container(
    decoration: BoxDecoration(
   color:Color.fromRGBO(144, 155, 184, 1),
   border: Border.all(
    color:Colors.grey,
    width: 1.5,
   ),
   borderRadius: BorderRadius.circular(8.0)
    ),
    child: ListTile(
      leading:
      Icon(Icons.download,color: Colors.black,weight:700,size:27,),
      
      title: Text("BEST AFRICAN GOSPEL", 
       style: TextStyle
      (fontWeight: FontWeight.w700,
        fontSize: 20,
        fontFamily: "Roboto",
        color: Colors.black,
      ),
      ),
      subtitle: Text("Best African Gospel of the year 2025", style: TextStyle
      (fontWeight: FontWeight.w900,
        fontSize: 15,
        fontFamily: "Roboto",
      ),
      ),
  //  onTap: () {},
      trailing:
      Icon(Icons.arrow_forward_ios),  
      onTap: () {
    // Action when the ListTile is tapped
    print('ListTile tapped!');
  },  
    ),
  ),
),
                ],                
            ),
          ),
   ),

    );
  }
}