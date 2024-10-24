
import 'dart:typed_data';

import 'package:donation/widget/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import '../widget/cTextFormField.dart';
import '../widget/edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static String id = 'ProfilePage';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ThemeMode _currentThemeMode = ThemeMode.system;
  // File? SelectImage;

  Uint8List? _image;
  @override
  Widget build(BuildContext context) {
    var email= ModalRoute.of(context)!.settings.arguments;
    return Scaffold(

        appBar: AppBar(
          leading: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          elevation: 0.1,
          centerTitle: true,
          title: const Text(
            'My Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _currentThemeMode = _currentThemeMode == ThemeMode.dark
                      ? ThemeMode.light
                      : ThemeMode.dark;
                });
              },
              icon: Icon(
                _currentThemeMode == ThemeMode.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
                color: Colors.black,
              ),
            ),
          ],
        ),

      body: SingleChildScrollView(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
               SizedBox(height: 10),
              Stack(
                children:[
                  _image!= null?CircleAvatar(
                    backgroundImage:
                    MemoryImage(_image!),
                    radius: 75.0,
                  ):
                  Container(
                    child: const CircleAvatar(
                      backgroundImage:
                      AssetImage("assets/images/vector-flat-illustration-grayscale-avatar-600nw-2281862025.webp"),
                      radius: 75.0,
                    ),
                  ),
                  Positioned(
                    bottom: 20.0,
                    right: 20.0,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.teal,
                        size: 28.0,
                      ),
                    ),
                  ),
                ]
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  hintText: 'Name',

                ),
              ),
              Card(
                child: ListTile(
                  title: Text(email.toString()),
                  onTap: () {},
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.email),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: const Text("Edit Profile"),
                      onTap: () {
                      },
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: CustomTextField(
                        hintText: 'Edit your name',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12,right: 12),
                      child: CustomTextField(
                        hintText: ' Edit Email',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: CustomTextField(
                        hintText: ' Password',
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: const Text("Settings"),
                        onTap: () {
                          Navigator.of(context).pushNamed('/settings');
                        },
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/settings');
                              },
                              icon: const Icon(Icons.settings),
                            ),
                          ],
                        ),

                      ),
                    ),
                  ],
                ),

              ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                        textButton: 'submit',
                      onTap: (){},
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    takePhoto(ImageSource.camera);
                  },
                  child: SizedBox(
                    child: Column(
                        children: [
                          Icon(Icons.camera),Text('Gallart')
                        ],
                    ),
                  ),
            ),
                IconButton(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
            ),
          ])
        ],
      ),
    );
  }
  Future takePhoto(ImageSource gallery) async {
    final returnimage = await ImagePicker().
    pickImage(source: ImageSource.gallery);
    if(returnimage==null) return;
    setState(() {


    });
  }
}

