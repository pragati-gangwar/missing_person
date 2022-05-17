import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:missing_people/Screens/login_screen.dart';
import 'package:missing_people/Screens/signup_screen.dart';
import 'package:missing_people/Screens/upload_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF2A2550),
        appBar: AppBar(
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
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    minWidth: 300.0,
                    height: 50.0,
                    child: Text(
                      'I\'m searching for a missing person',
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
              SizedBox(height: 9),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Material(
                  color: const Color(0xFFE04D01),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UploadImage_Page()));
                    },
                    minWidth: 300.0,
                    height: 50.0,
                    child: Text(
                      'I\'ve found a lost person',
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
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an Account? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
