import 'dart:math';

import 'package:flutter/material.dart';
import 'package:missing_people/Screens/HOME2.dart';
import 'package:confetti/confetti.dart';

class WelcomeHome extends StatefulWidget {
  @override
  _WelcomeHomeState createState() => _WelcomeHomeState();
}

class _WelcomeHomeState extends State<WelcomeHome> {
  bool isplaying = false;
  final controller = ConfettiController();

  @override
  void initState() {

    super.initState();
    controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: [
      Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Stack(children: [
              Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Color(0xFF251D3A),
                  )),
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120.0, left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        'Welcome, Pramila Gangwar!',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Invite your friends and access a one click service to make our society safer place',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 180.0, left: 30, right: 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 20,

                      shadowColor: Colors.black,

                      color: Colors.white,

                      child: SizedBox(
                        width: 400,

                        height: 500,

                        child: Padding(
                          padding: const EdgeInsets.all(20.0),

                          child: Column(children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xFFE04D01),

                              radius: 108,

                              child: CircleAvatar(
                                backgroundImage: AssetImage("images/db5.jpeg"),
                                radius: 100,
                              ), //CircleAvatar
                            ), //CircleAvatar

                            SizedBox(
                              height: 10,
                            ), //SizedBox

                            SizedBox(
                              height: 59,
                            ), //SizedBox

                            Container(
                              height: 100.0,
                              width: 240.0,
                              color: Colors.transparent,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE04D01),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: new Center(
                                    child: new Text(
                                      "Found A Match!!",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 19),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ),

                            SizedBox(
                              height: 10,
                            ), //
                            TextButton(
                              style: TextButton.styleFrom(
                                  primary: Color(0xFFE04D01),
                                  elevation: 2,
                                  backgroundColor: Color(0xFFE04D01)),
                              onPressed: () {},
                              child: Text(
                                "Contact Founder",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ]), //Column
                        ), //Padding
                      ), //SizedBox
                    ), //Card
                  ],
                ),
              )
            ]),
          )),
      ConfettiWidget(
        confettiController: controller,
        shouldLoop: true,
        blastDirection: pi / 2,
      ),
    ]);
  }
}
