import 'package:e_vote/Services/authservices.dart';
import 'package:e_vote/components/widgets/list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  Future<void> signOut()async{
    final auth = Authservices();
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/frame1.jpg'), 
            fit: BoxFit.cover, 
          ),
        ),
        child: ListView(
          padding:EdgeInsets.all(0),
         children : [
          SizedBox(height: 130,),
           Row(
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

                     SizedBox(height: 30,),
                 MyListTile(text: 'Voter Details', onPressed: (){},
                  icon: Icon(Icons.wallet,color: Colors.white,),),

                   SizedBox(height: 30,),
                 MyListTile(text: 'Profile Setting', onPressed: (){},
                  icon: Icon(Icons.settings,color: Colors.white,),),

                  SizedBox(height: 30,),
                 MyListTile(text: 'Change Password', onPressed: (){},
                  icon: Icon(Icons.rotate_left_rounded,color: Colors.white,),),

                   SizedBox(height: 30,),
                 MyListTile(text: 'Logout', onPressed: ()async{
                 await signOut();
                 Navigator.pushNamed(context, '/login');
                 },
                  icon: Icon(Icons.logout,color: Colors.white,),)
         ]
        ),
      ),
    );
  }
}