import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(19.0),
          child: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color.fromRGBO(255, 255, 255, 1)),
                    onPressed: () => {},
                  ),
                ),
          
                const SizedBox(height: 101),
          
                const Text(
                  "Profile",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ), 
          
                const SizedBox(height: 20),
          
                const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/images/Ellipse 4.jpg"),
                ),
          
                const SizedBox(height: 9),
                const Text(
                  "Jane Benjamin",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
          
                const Text(
                  "Auditor",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    fontWeight:FontWeight.w400,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
          
                const SizedBox(height: 96),
          
                Row(
                  children: const [
                    Icon(Icons.edit, color: Color.fromRGBO(132, 166, 255, 1)),
                    SizedBox(width: 20,),
                    Text("Edit Profile", style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 16,fontFamily: "Roboto",fontWeight:FontWeight.w600,)),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Color.fromRGBO(255, 255, 255, 1)),
                  ],
                ),
                const SizedBox(height: 62),
                Row(
                  children: const [
                    Icon(Icons.notification_important,  color: Color.fromRGBO(132, 166, 255, 1)),
                    SizedBox(width: 20,),
                    Text("Notificatiuon", style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 16,fontFamily: "Roboto",fontWeight:FontWeight.w600,)),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Color.fromRGBO(255, 255, 255, 1)),
                  ],
                ),
                const SizedBox(height: 62),
                Row(
                  children: const [
                    Icon(Icons.lock,  color: Color.fromRGBO(132, 166, 255, 1)),
                    SizedBox(width: 20,),
                    Text("Change Password", 
                    style: TextStyle
                    (color: Color.fromRGBO(255, 255, 255, 1), fontSize: 16,fontFamily: "Roboto",fontWeight:FontWeight.w600,)),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Color.fromRGBO(255, 255, 255, 1)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
