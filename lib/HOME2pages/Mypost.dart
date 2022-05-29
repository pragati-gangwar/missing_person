import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Screens/HOME2.dart';

class MyPosts extends StatefulWidget {
  @override
  _MyPostsState createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Container(
              height: 400,
              decoration: BoxDecoration(
                color: Color(0xFF251D3A),
              )),
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Home2Page()));
              },
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0, left: 16, right: 16),
            child: Column(
              children: [
                Card(
                    margin: const EdgeInsets.all(12),
                    clipBehavior: Clip.antiAlias,
                    elevation: 16,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(alignment: Alignment.bottomLeft, children: [
                              Ink.image(
                                height: 270,
                                image: AssetImage('images/mypost.jpeg'),
                                fit: BoxFit.fitWidth,
                              )
                            ]),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, top: 16, right: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tanisha Agarwal',
                                      style: TextStyle(
                                          color: Color(0xFFE04D01),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'Age: 18',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      'Place: Rampur',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      'Date: 25/06/2022',
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                )),
                            ButtonBar(),
                          ],
                        ))),
              ],
            ),
          )
        ]));
  }
}
