import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:missing_people/Custom/textItem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'HOME2.dart';
import 'home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
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
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),
                ),
                SizedBox(height: 40),
                Image(
                  image: AssetImage('images/login_image.png'),
                  height: 250,
                  width: 300,
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 60.0, right: 60.0, bottom: 12.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: const Color(0xFFFF7700),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color(0xFFE04D01), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color(0xFFE04D01), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      left: 60.0, right: 60.0, bottom: 12.0),
                  child: TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color(0xFFE04D01), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color(0xFFE04D01), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 7),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Material(
                    color: const Color(0xFFE04D01),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home2Page()));
                          }
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                      minWidth: 200.0,
                      height: 50.0,
                      child: Text(
                        'CONTINUE',
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

                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (builder) => LoginPage()),
                        (route) => false);
                  },
                  child: Text(
                    "Forgotten Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
