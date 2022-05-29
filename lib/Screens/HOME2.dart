import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:missing_people/HOME2pages/Dashboard.dart';
import 'package:missing_people/HOME2pages/Mypost.dart';
import 'package:missing_people/HOME2pages/Profile.dart';
import 'package:missing_people/HOME2pages/welcomePage.dart';
import 'package:missing_people/Screens/upload_image.dart';

class Home2Page extends StatefulWidget {
  const Home2Page({Key? key}) : super(key: key);

  @override
  _Home2PageState createState() => _Home2PageState();
}

class _Home2PageState extends State<Home2Page> {
  openBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: new Icon(
                Icons.add_a_photo_outlined,
                color: Color(0xFFE04D01),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UploadImage_Page()));
              },
              title: new Text(
                'Add a new missing person',
                style: TextStyle(
                  color: Color(0xFFE04D01),
                ),
              ),
            ),
            ListTile(
              leading: new Icon(
                Icons.add_photo_alternate_outlined,
                color: Color(0xFFE04D01),
              ),
              title: new Text(
                'Found a lost Person',
                style: TextStyle(
                  color: Color(0xFFE04D01),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UploadImage_Page()));
              },
            ),
          ],
        );
      },
    );
  }

  int currentTab = 0;
  final List<Widget> screeens = [
    WelcomeHome(),
    MyPosts(),
    Dashboard(),
    Profile(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = WelcomeHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Padding(
      //     padding: const EdgeInsets.only(top: 10.0),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text(
      //           'missing',
      //           style: TextStyle(
      //             color: const Color(0xFFE04D01),
      //             letterSpacing: -1,
      //             fontSize: 28,
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(right: 13.0),
      //           child: Text(
      //             'PERSON',
      //             style:
      //                 TextStyle(color: const Color(0xFF2A2550), fontSize: 30),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFE04D01),
        child: Icon(
          Icons.camera_alt_outlined,
          color: Colors.black,
        ),
        onPressed: () {
          openBottomSheet(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF251D3A),
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = WelcomeHome();
                        currentTab = 0;
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeHome()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          (Icons.home_outlined),
                          color: currentTab == 0
                              ? const Color(0xFFE04D01)
                              : Colors.white,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: currentTab == 0
                                ? const Color(0xFFE04D01)
                                : Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = MyPosts();
                        currentTab = 1;
                      });
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MyPosts()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          (Icons.perm_contact_cal_outlined),
                          color: currentTab == 1
                              ? const Color(0xFFE04D01)
                              : Colors.white,
                        ),
                        Text(
                          'My Post',
                          style: TextStyle(
                            color: currentTab == 1
                                ? const Color(0xFFE04D01)
                                : Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Dashboard();
                        currentTab = 3;
                      });
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          (Icons.dashboard_outlined),
                          color: currentTab == 3
                              ? const Color(0xFFE04D01)
                              : Colors.white,
                        ),
                        Text(
                          'Dashboard',
                          style: TextStyle(
                            color: currentTab == 3
                                ? const Color(0xFFE04D01)
                                : Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Profile();
                        currentTab = 4;
                      });
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          (Icons.menu_outlined),
                          color: currentTab == 4
                              ? const Color(0xFFE04D01)
                              : Colors.white,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTab == 4
                                ? const Color(0xFFE04D01)
                                : Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
