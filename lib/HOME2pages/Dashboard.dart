import 'package:flutter/material.dart';
import 'package:missing_people/Screens/HOME2.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
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
          padding: const EdgeInsets.only(top: 110.0, left: 16, right: 16),
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
                              height: 240,
                              image: AssetImage('images/db1.jpeg'),
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
                                    'Rashi singh',
                                    style: TextStyle(
                                        color: Color(0xFFE04D01),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'Age: 5',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    'Place: Delhi',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    'Date: 29/06/2022',
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              )),
                          ButtonBar(),
                        ],
                      ))),
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
                              height: 240,
                              image: AssetImage('images/db2.jpeg'),
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
                                    'kituka devi',
                                    style: TextStyle(
                                        color: Color(0xFFE04D01),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'Age: 79',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    'Place: shyam mandir,Lucknow',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    'Date: 29/06/2022',
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              )),
                          ButtonBar(),
                        ],
                      ))),
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
                              height: 240,
                              image: AssetImage('images/db3.jpeg'),
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
                                    'Abhinav singh',
                                    style: TextStyle(
                                        color: Color(0xFFE04D01),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'Age: 19',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    'Place: meerut',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    'Date: 29/06/2022',
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              )),
                          ButtonBar(),
                        ],
                      ))),
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
                              height: 240,
                              image: AssetImage('images/db4.jpeg'),
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
                                    'shruti raj',
                                    style: TextStyle(
                                        color: Color(0xFFE04D01),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'Age: 39',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    'Place: Delhi',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    'Date: 29/06/2022',
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              )),
                          ButtonBar(),
                        ],
                      ))),
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
                              height: 240,
                              image: AssetImage('images/db6.jpeg'),
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
                                    'Aman dev',
                                    style: TextStyle(
                                        color: Color(0xFFE04D01),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'Age: 24',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    '32,Ram Road,Bareilly',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    'Date: 29/06/2022',
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              )),
                          ButtonBar(),
                        ],
                      ))),
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
                              height: 240,
                              image: AssetImage('images/db5.jpeg'),
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
                                    'Date: 29/06/2022',
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              )),
                          ButtonBar(),
                        ],
                      ))),
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
                              height: 240,
                              image: AssetImage('images/db7.jpeg'),
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
                                    'Pragati Gangwar',
                                    style: TextStyle(
                                        color: Color(0xFFE04D01),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'Age: 21',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    'Place: 70-Kunwar garh,Pilibhit',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    'Date: 29/06/2022',
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
      ]),
    ));
  }
}
