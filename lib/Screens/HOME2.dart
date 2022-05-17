import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home2Page extends StatefulWidget {
  const Home2Page({Key? key}) : super(key: key);

  @override
  _Home2PageState createState() => _Home2PageState();
}

class _Home2PageState extends State<Home2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A2550),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          AppBar(
            backgroundColor: const Color(0xFF251D3A),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_rounded),
              onPressed: () {
                // Navigator.pushReplacement(context,
                // MaterialPageRoute(builder: (context) => HomePage()));
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
        ]),
      ),
    );
  }
}
