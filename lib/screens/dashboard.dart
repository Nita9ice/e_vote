import 'dart:io';

import 'package:e_vote/components/utilities/app_dimension.dart';
import 'package:e_vote/components/utilities/drawer.dart';
import 'package:e_vote/components/widgets/dashboard_container.dart';
import 'package:e_vote/providers/userprofileprovider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Store selected image (File for native, Uint8List for web)
  dynamic selectedImage;

  @override
  Widget build(BuildContext context) {
  
    // Instantiate AppDimensions
    final dimensions = AppDimensions(context);

    

     // Function to pick an image file (with basic error handling)
  Future<void> pickImage() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      final size = kIsWeb
          ? result.files.single.bytes!.length
          : await File(result.files.single.path!).length();

      if (size > 5 * 1024 * 1024) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Image too large (max 5MB)')),
        );
        return;
      }

      
      setState(() {
        if (kIsWeb) {
          selectedImage = result.files.single.bytes; // Uint8List
        } else {
          selectedImage = File(result.files.single.path!); // File
        }
      });
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error picking image: $e')),
    );
  }
}


    
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
        drawer: MyDrawer(),
      
        body: Consumer<Userprofileprovider>(builder:(context, userprovider, hild ){
        final user =  userprovider.userProfile;
          return 
          Container(
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
      
                   
                   SizedBox(height: 81,),
                   Stack(
                     children: [
                      CircleAvatar(
                      radius: 120,
                      backgroundImage: selectedImage != null
                      ? (kIsWeb
                               ? MemoryImage(selectedImage as Uint8List)
                               : FileImage(selectedImage as File)) as ImageProvider
                           : AssetImage('assets/images/image1.png'),
                      backgroundColor: Colors.transparent,
                     ),
                      Positioned(
                    bottom: 15,
                    right: 15,
                    child: IconButton(onPressed: pickImage, icon: Icon(Icons.add_a_photo_rounded,
                    color: Colors.white,
                    size: 30,
                    )),
                    )
                     ]
                      
                   ),

                  

                  
                    
                   SizedBox(height: 7,),
                      
                   Text(user?.name.join('  ')??'',
                   style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: dimensions.widthPercent(8.4), // ~20.21px
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                ),
                   ),
                   SizedBox(height: 7,),
                   Text(user?.email??'',
                   style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: dimensions.widthPercent(4.7), // ~20.21px
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                ),
                   ),
                   SizedBox(height: 30,),
                      
                   Row(
                    children: [
                      DashboardContainer(
                        onPressed: (){
                          Navigator.pushNamed(context, '/create');
                        },
                        containerImage: Image.asset('assets/icons/Vector1.png'), containerText: 'CREATE ELECTION', imageHeight: 47, imageWidth: 70,
      
                  
                        ),
                      SizedBox(width: 26,),
                       DashboardContainer(
                        onPressed: (){
                          Navigator.pushNamed(context, '/election');
                        },
                        containerImage: Image.asset('assets/icons/Vector2.png'), containerText: 'MY \n ELECTION', imageHeight: 63, imageWidth: 63,)
                    ],
                   ),
                      
                   SizedBox(height: 30,),
                      
                   Row(
                    children: [
                      DashboardContainer(
                        onPressed: () {
                            Navigator.pushNamed(context, '/audit');  
                          },
                        containerImage: Image.asset('assets/images/logo.png'), containerText: 'AUDIT', imageHeight: 68, imageWidth: 74,),
                      SizedBox(width: 26,),
                     DashboardContainer(
                          onPressed: () {
                            Navigator.pushNamed(context, '/join');  
                          },
                          containerImage: Image.asset('assets/icons/Vector4.png'),
                          containerText: 'CAST\n VOTE',
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
        );
        }) 
      ),
    );

      
    

  }

}