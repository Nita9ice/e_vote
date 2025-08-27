import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          spacing:20.0 ,
          
          children: [
            SizedBox(height: 100,),
            Padding(padding: const EdgeInsets.all(16.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Image.asset(
                'assets/images/logo.jpg',
                width: 100,
              ),
              Text('E-voting',style: TextStyle(color: Colors.white,fontSize:40),)
              ],
              
            ),
          
            ),
          
           
            SizedBox(height:20,),
                      ListTile(
       leading: Icon(Icons.wallet,color: Colors.white,),
       title: Text('voters details',style: TextStyle(color:Colors.white),),
       onTap: () {},
            ),
            ListTile(
       leading: Icon(Icons.settings,color: Colors.white,),
       title: Text('Profile Settings',style: TextStyle(color:Colors.white),),
       onTap: () {},
            ),
         ListTile(
       leading: Icon(Icons.add,color: Colors.white,),
       title: Text('Add Audit',style: TextStyle(color:Colors.white),),
       onTap: () {},
            ),
                ListTile(
       leading: Icon(Icons.lock,color: Colors.white,),
       title: Text('Profile Settings',style: TextStyle(color:Colors.white),),
       onTap: () {},
            ),
                     ListTile(
       leading: Icon(Icons.lock,color: Colors.white,),
       title: Text('Faqs',style: TextStyle(color:Colors.white),),
       onTap: () {},
            ),
                ListTile(
       leading: Icon(Icons.logout,color: Colors.white,),
       title: Text('Logout',style: TextStyle(color:Colors.white),),
       onTap: () {},
            ),
      
          ],
        ),
      ),
     );
    
  
  }
}