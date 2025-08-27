import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:e_vote/components/utilities/drawer.dart';
import 'package:e_vote/components/widgets/dashboard_container.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    // Instantiate AppDimensions
    final dimensions = AppDimensions(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
      ),
      drawer: MyDrawer(),

      // ✅ Drawer without background image
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue, // You can change this color
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo.jpg',
                    width: 80,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'E-voting',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Drawer items
            ListTile(
              leading: const Icon(Icons.wallet, color: Colors.black),
              title: const Text(
                'Voters Details',
                style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.black),
              title: const Text(
                'Profile Settings',
                style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.add, color: Colors.black),
              title: const Text(
                'Add Audit',
                style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.lock, color: Colors.black),
              title: const Text(
                'Profile Settings',
                style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.black),
              title: const Text(
                'FAQs',
                style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black),
              title: const Text(
                'Logout',
                style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 81),
                  const CircleAvatar(
                    radius: 120,
                    backgroundImage: AssetImage('assets/images/image1.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Matthew',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: dimensions.widthPercent(8.4),
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'admin@admin.com',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: dimensions.widthPercent(4.7),
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),

                  Row(
                    children: [
                      DashboardContainer(
                        onPressed: () {
                          Navigator.pushNamed(context, '/create');
                        },
                        containerImage:
                            Image.asset('assets/icons/Vector1.png'),
                        containerText: 'CREATE ELECTION',
                        imageHeight: 47,
                        imageWidth: 70,
                      ),
                    SizedBox(width: 26,),
                     DashboardContainer(containerImage: Image.asset('assets/icons/Vector2.png'), containerText: 'MY \n ELECTION', imageHeight: 63, imageWidth: 63,)
                  ],
                 ),
                    
                 SizedBox(height: 30,),
                    
                 Row(
                  children: [
                    DashboardContainer(containerImage: Image.asset('assets/images/logo.png'), containerText: 'DELETE \n VOTE', imageHeight: 68, imageWidth: 74,),
                    SizedBox(width: 26,),
                    DashboardContainer(containerImage: Image.asset('assets/icons/Vector4.png'), containerText: 'FAQ', imageHeight: 63, imageWidth: 63, onPressed: (){
                      Navigator.pushNamed(context, '/faq');
                    },)
                  ],
                 ),
                    
                 
                   

                      const SizedBox(width: 26),
                      DashboardContainer(
                        containerImage:
                            Image.asset('assets/icons/Vector2.png'),
                        containerText: 'MY \n ELECTION',
                        imageHeight: 63,
                        imageWidth: 63,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  Row(
                    children: [
                      DashboardContainer(
                        containerImage: Image.asset('assets/images/logo.jpg'),
                        containerText: 'DELETE \n VOTE',
                        imageHeight: 68,
                        imageWidth: 74,
                      ),
                      const SizedBox(width: 26),
                      DashboardContainer(
                        onPressed: () {
                          Navigator.pushNamed(context, '/join_vote');  
                        },
                        containerImage: Image.asset('assets/icons/Vector4.png'),
                        containerText: 'JOIN VOTE',
                        imageHeight: 63,
                        imageWidth: 63,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
