import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:missing_people/Screens/upload_image.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../services/global_method.dart';
import 'HOME2.dart';
import 'dart:io';
import 'home_screen.dart';

String _emailAddress = '';
String _password = '';
String _fullName = '';
late int _phoneNumber;
File _pickedImage = File('');
String url = '';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  bool _obscureText = true;

  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalMethods _globalMethods = GlobalMethods();
  bool _isLoading = false;

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    var date = DateTime.now().toString();
    var dateparse = DateTime.parse(date);
    var formattedDate = "${dateparse.day}-${dateparse.month}-${dateparse.year}";
    if (isValid) {
      _formKey.currentState!.save();
      try {
        final newUser = await _auth.createUserWithEmailAndPassword(
            email: _emailAddress.toLowerCase().trim(),
            password: _password.trim());
        final User? user = _auth.currentUser;
        final _uid = user!.uid;
        await FirebaseFirestore.instance.collection('users').doc(_uid).set({
          'id': _uid,
          'name': _fullName,
          'email': _emailAddress,
          'phoneNumber': _phoneNumber,
          'joinedAt': formattedDate,
          'url': '',
          'createdAt': Timestamp.now(),
        });
        if (newUser != null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => UploadImage_Page()));
        }
      } catch (error) {
        _globalMethods.authErrorHandle(error.toString(), context);
        print('error occured ${error}');
      }
    }
  }

  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF2A2550),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBar(
                  backgroundColor: const Color(0xFF251D3A),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_rounded),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
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
                SizedBox(height: 60),
                Image(
                  image: AssetImage('images/signup_image.png'),
                  height: 250,
                  width: 300,
                ),
                SizedBox(
                  height: 24,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            key: ValueKey('name'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'name cannot be null';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_emailFocusNode),
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                labelText: 'Full name',
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                fillColor: const Color(0xFFE04D01)),
                            onSaved: (value) {
                              _fullName = value!;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            key: ValueKey('email'),
                            cursorColor: Colors.white,
                            focusNode: _emailFocusNode,
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_passwordFocusNode),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                labelText: 'Email Address',
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                fillColor: const Color(0xFFE04D01)),
                            onSaved: (value) {
                              _emailAddress = value!;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            key: ValueKey('Password'),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 7) {
                                return 'Please enter a valid Password';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            focusNode: _passwordFocusNode,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.white,
                                  ),
                                ),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                fillColor: const Color(0xFFE04D01)),
                            onSaved: (value) {
                              _password = value!;
                            },
                            obscureText: _obscureText,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_phoneNumberFocusNode),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            key: ValueKey('phone number'),
                            focusNode: _phoneNumberFocusNode,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a valid phone number';
                              }
                              return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.white,
                            onEditingComplete: _submitForm,
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.phone_android,
                                  color: Colors.white,
                                ),
                                labelText: 'Phone number',
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                fillColor: const Color(0xFFE04D01)),
                            onSaved: (value) {
                              _phoneNumber = int.parse(value!);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Material(
                            color: const Color(0xFFE04D01),
                            borderRadius:
                                BorderRadius.all(Radius.circular(14.0)),
                            elevation: 5.0,
                            child: MaterialButton(
                              onPressed: _submitForm,
                              minWidth: 232.0,
                              height: 30.0,
                              child: Text(
                                'Sign Up',
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
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
