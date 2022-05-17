import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:missing_people/Screens/home_screen.dart';

class SocialM extends StatelessWidget {
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
            children: [
              SizedBox(height: 40),
              Text(
                'Social Message',
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(height: 40),
              Center(
                child: Text(
                  'There are many people in the world who \nis missing from home or family. In most \ncases, we find that small children are\nmissing from their parents in a public\nplace.\n\n\nIf someone is waiting for you at your\nhome, how does it feel when you don\'t \ncome back home within time.Same way\nlots of people in our country are\nmissing and not come back to home.\n\n\nSo we have designed one application\nwhich is helping a person to find\ntheir missing families. Here anyone\ncan post about a missing person or\ncan get details about found people.\n\n\n',
                  style: TextStyle(
                      overflow: TextOverflow.visible,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              SizedBox(height: 18),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Material(
                  color: const Color(0xFFE04D01),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    minWidth: 300.0,
                    height: 50.0,
                    child: Text(
                      'Get Started',
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
        ));
  }
}
