import 'package:e_vote/providers/userprofileprovider.dart';
import 'package:flutter/material.dart';
import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:provider/provider.dart';

// ProfileScreen displays the user's personal information (profile picture, name, role)
// and provides quick navigation options such as editing profile, checking notifications,
// and changing the password. 
// The layout is responsive using AppDimensions for consistent scaling.

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Create an AppDimensions object for responsive sizing
    final dims = AppDimensions(context);

    return Scaffold(
     body: Consumer<Userprofileprovider>(builder:(context, userprovider, hild ){
      final user =  userprovider.userProfile;
        return  
      Container(
        // Full-screen background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          // Uniform padding around the content
          padding: EdgeInsets.all(dims.widthPercent(4)), // instead of 24
          child: SafeArea(
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

                SizedBox(height: dims.heightPercent(9)), // Spacing before title

                // Page title
                Text(
                  "Profile",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: dims.fontSizeLarge,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: dims.heightPercent(2.5)),

                // User profile image
                CircleAvatar(
                  radius: dims.widthPercent(20),
                  backgroundImage:
                      const AssetImage("assets/images/Ellipse 4.jpg"),
                ),

                SizedBox(height: dims.heightPercent(1.2)),

                // User name
                Text(
                  user?.name.join('  ')??'',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                                fontSize: dims.widthPercent(7), // ~20.21px
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),

                // User role/position
                Text(
                  user?.email??'',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                                fontSize: dims.widthPercent(4), // ~20.21px
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),

                SizedBox(height: dims.heightPercent(6)),

                // ===== Option Row: Edit Profile =====
                Row(
                  children: [
                    const Icon(
                      Icons.edit,
                      color: Color.fromRGBO(132, 166, 255, 1),
                    ),
                    SizedBox(width: dims.widthPercent(5)),
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: dims.fontSizeSmall,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/edit'); // Navigate to edit profile
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: dims.heightPercent(4)),

                // ===== Option Row: Notifications =====
                Row(
                  children: [
                    const Icon(
                      Icons.notification_important,
                      color: Color.fromRGBO(132, 166, 255, 1),
                    ),
                    SizedBox(width: dims.widthPercent(5)),
                    Text(
                      "Notification",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: dims.fontSizeSmall,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/notification'); // Navigate to notifications
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: dims.heightPercent(4)),

                // ===== Option Row: Change Password =====
                Row(
                  children: [
                    const Icon(
                      Icons.lock,
                      color: Color.fromRGBO(132, 166, 255, 1),
                    ),
                    SizedBox(width: dims.widthPercent(5)),
                    Text(
                      "Change Password",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: dims.fontSizeSmall,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/change'); // Navigate to change password
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );}
      ),
    );
  }
}
