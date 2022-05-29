import 'package:flutter/material.dart';

import '../Screens/HOME2.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Container(
            height: 310,
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
          padding: const EdgeInsets.only(top: 180.0, left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Your Profile',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Pramila Gangwar \n9398382396',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        // SizedBox(
        //   h,
        // ),
        Padding(
          padding: const EdgeInsets.only(top: 290.0),
          child: ListView(
            children: const <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.face,
                    color: Colors.black87,
                  ),
                  title: Text('About you'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.black87,
                  ),
                  title: Text('Your reported Person'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.face,
                    color: Colors.black87,
                  ),
                  title: Text('About you'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.person_search_outlined,
                    color: Colors.black87,
                  ),
                  title: Text('Found a missing person'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.add_photo_alternate_outlined,
                    color: Colors.black87,
                  ),
                  title: Text('Add a new person'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.mobile_friendly_rounded,
                    color: Colors.black87,
                  ),
                  title: Text('Contact Us'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.notes,
                    color: Colors.black87,
                  ),
                  title: Text('About MissingPerson'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.black87,
                  ),
                  title: Text('Log Out'),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
