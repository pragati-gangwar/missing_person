import 'dart:async';
import 'package:flutter/material.dart';
import 'package:missing_people/Screens/social_message.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SocialM())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF2A2550),
        body: SafeArea(
            child: Center(
          child: Image(
            image: AssetImage('images/logo.png'),
          ),
        )));
  }
}
