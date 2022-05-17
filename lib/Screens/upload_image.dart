import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:missing_people/Screens/login_screen.dart';
import 'package:missing_people/Screens/signup_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'home_screen.dart';

class UploadImage_Page extends StatefulWidget {
  const UploadImage_Page({Key? key}) : super(key: key);

  @override
  _UploadImage_PageState createState() => _UploadImage_PageState();
}

class _UploadImage_PageState extends State<UploadImage_Page> {
  XFile? imagePath;
  final ImagePicker _picker = ImagePicker();
  FirebaseFirestore firestoreRef = FirebaseFirestore.instance;
  FirebaseStorage storageRef = FirebaseStorage.instance;
  String collectionName = "image";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF2A2550),
        appBar: AppBar(
          backgroundColor: const Color(0xFF251D3A),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'missing',
                style: TextStyle(
                  color: const Color(0xFFE04D01),
                  letterSpacing: -1,
                  fontSize: 28,
                ),
              ),
              Text(
                'PERSON',
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text(
              'Help Us find the missing Person!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Take a photo of the person you have found and fill in some details.',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 20),
            Image(
              image: AssetImage('images/logo1.png'),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Material(
                color: const Color(0xFFE04D01),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    // imageGallery = await singleImagePick();
                    // if (imageGallery != null && imageGallery!.path.isNotEmpty) {
                    //   setState(() {});
                    // }
                  },
                  minWidth: 300.0,
                  height: 50.0,
                  child: Text(
                    'TAKE A PHOTO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0,
                      wordSpacing: 0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 7),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Material(
                color: const Color(0xFFE04D01),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    imagePicker();
                  },
                  minWidth: 300.0,
                  height: 50.0,
                  child: Text(
                    'UPLOAD FROM GALLERY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0,
                      wordSpacing: 0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  imagePicker() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imagePath = image;
      });
    }
  }
}
