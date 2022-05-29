import 'dart:convert';
import 'dart:developer';
import 'package:missing_people/Screens/form_fields.dart';
import 'package:path/path.dart' as path;
import 'dart:io' as io;
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:flutter_face_api_beta/face_api.dart' as Regula;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:missing_people/Screens/login_screen.dart';
import 'package:missing_people/Screens/signup_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../services/global_method.dart';
import 'backend.dart';
import 'home_screen.dart';

import 'dart:async';

late String url;

class UploadImage_Page extends StatefulWidget {
  const UploadImage_Page({Key? key}) : super(key: key);

  @override
  _UploadImage_PageState createState() => _UploadImage_PageState();
}

class _UploadImage_PageState extends State<UploadImage_Page> {
  File _pickedImage = File('images/logo1.png');
  late Stream<QuerySnapshot> selectedDoc;
  String _similarity = "nil";

  var image1 = new Regula.MatchFacesImage();
  var image2 = new Regula.MatchFacesImage();
  final _auth = FirebaseAuth.instance;

  // @override
  // void initState() {
  //   super.initState();
  //   getCurrentUser();
  // }
  GlobalMethods _globalMethods = GlobalMethods();

  Future<void> getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      final loggedInUser = user;
      if (_pickedImage == File('images/logo1.png')) {
        _globalMethods.authErrorHandle('Please pick an image', context);
      } else {
        final ref = FirebaseStorage.instance
            .ref()
            .child('usersImages')
            .child(loggedInUser!.uid + '.jpg');
        await ref.putFile(_pickedImage);
        url = await ref.getDownloadURL();
        //
        // missing obj = missing(surl: url);
        // var x = obj.finding();
        // StreamBuilder<QuerySnapshot>(
        //
        //     // <2> Pass `Stream<QuerySnapshot>` to stream
        //     stream: FirebaseFirestore.instance
        //         .collection('users')
        //         .where('url', isEqualTo: x.)
        //         .snapshots(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         // <3> Retrieve `List<DocumentSnapshot>` from snapshot
        //         final List<DocumentSnapshot> documents = snapshot.data!.docs;
        //         print(documents.length);
        //       }
        //       return SizedBox(
        //         height: 0,
        //       );
        //     });

        final docUser = FirebaseFirestore.instance
            .collection('users')
            .doc(loggedInUser.uid);
        docUser.update({'url': url});
      }
    } catch (e) {
      print(e);
    }
  }

  // matchFaces() async {
  //   print(_similarity);
  //   FirebaseStorage storage = FirebaseStorage.instance;
  //   final ListResult result = await storage.ref().list();
  //   final List<Reference> allFiles = result.items;
  //
  //   Future.forEach<Reference>(allFiles, (file) async {
  //     final String fileUrl = await file.getDownloadURL();
  //     print(fileUrl);
  //   });
  //
  //   Future.forEach<Reference>(allFiles, (file) async {
  //     final String fileUrl = await file.getDownloadURL();
  //     File dbimage = File(fileUrl);
  //     image2.bitmap = base64Encode(io.File(dbimage.path).readAsBytesSync());
  //
  //     if (image1.bitmap == null ||
  //         image1.bitmap == "" ||
  //         image2.bitmap == null ||
  //         image2.bitmap == "") return;
  //     setState(() => _similarity = "Processing...");
  //     var request = Regula.MatchFacesRequest();
  //     request.images = [image1, image2];
  //     Regula.FaceSDK.matchFaces(jsonEncode(request)).then((value) {
  //       var response = Regula.MatchFacesResponse.fromJson(json.decode(value));
  //       Regula.FaceSDK.matchFacesSimilarityThresholdSplit(
  //               jsonEncode(response!.results), 0.75)
  //           .then((str) {
  //         var split = Regula.MatchFacesSimilarityThresholdSplit.fromJson(
  //             json.decode(str));
  //         setState(() => _similarity = split!.matchedFaces.isNotEmpty
  //             ? ((split.matchedFaces[0]!.similarity! * 100).toStringAsFixed(2) +
  //                 "%")
  //             : "error");
  //       });
  //       print(_similarity);
  //     });
  //   });
  // }

  void _pickImageCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.camera);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    image1.bitmap = base64Encode(io.File(_pickedImage.path).readAsBytesSync());
    Navigator.pop(context);
  }

  void _pickImageGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    image1.bitmap = base64Encode(io.File(_pickedImage.path).readAsBytesSync());
    Navigator.pop(context);
  }

  Future UploadFile() async {}

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
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
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
                Padding(
                  padding:
                      const EdgeInsets.only(top: 6.0, left: 15.0, right: 15.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Take a photo of the person you have found and fill in some details.',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Stack(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: CircleAvatar(
                        radius: 160,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 140,
                          backgroundColor: const Color(0xFFE04D01),
                          backgroundImage:
                              _pickedImage == File('images/logo1.png')
                                  ? FileImage(_pickedImage)
                                  : FileImage(_pickedImage),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 290,
                        left: 260,
                        child: RawMaterialButton(
                          elevation: 10,
                          fillColor: const Color(0xFFE04D01),
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Choose option',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFFE04D01)),
                                    ),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          InkWell(
                                            onTap: _pickImageCamera,
                                            splashColor:
                                                const Color(0xFF251D3A),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.camera,
                                                    color:
                                                        const Color(0xFF251D3A),
                                                  ),
                                                ),
                                                Text(
                                                  'Camera',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: const Color(
                                                          0xFFE04D01)),
                                                )
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: _pickImageGallery,
                                            splashColor:
                                                const Color(0xFF251D3A),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.image,
                                                    color:
                                                        const Color(0xFF251D3A),
                                                  ),
                                                ),
                                                Text(
                                                  'Gallery',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: const Color(
                                                          0xFFE04D01)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                        ))
                  ],
                ),
                SizedBox(height: 60),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Material(
                    color: const Color(0xFFE04D01),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async {
                        getCurrentUser();
                        // matchFaces();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FormScreen()));

                        // final ref =
                        //     FirebaseStorage.instance.ref().child('usersImages');
                        // // url = await ref.getDownloadURL();
                        //
                        //
                        //
                        //
                        // final aurl = getDownloadURL(ref(storage, _pickedImage));
                      },
                      minWidth: 300.0,
                      height: 50.0,
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          wordSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<File>('_pickedImage', _pickedImage));
  }
}
