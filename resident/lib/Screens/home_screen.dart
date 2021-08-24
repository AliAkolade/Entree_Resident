import 'package:resident/Utils/bottom_nav_bar.dart';
import 'package:resident/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: 100,
          leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  IconButton(
                      icon: SvgPicture.asset('assets/vectors/menu.svg'),
                      tooltip: 'Menu',
                      onPressed: () {})
                ],
              )),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                  icon: SvgPicture.asset('assets/vectors/profileAvatar.svg'),
                  tooltip: 'Profile',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BottomNavBar(currentScreen: 4)));
                  },
                ))
          ],
        ),
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  shadowColor: xLogoDarkBlue,
                  elevation: 10,
                  color: xLogoDarkBlue,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 35, horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/vectors/sampleQR.svg'),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'John Alkali',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '012345',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                SvgPicture.asset('assets/vectors/copy.svg'),
                                SizedBox(width: 30),
                                SvgPicture.asset('assets/vectors/share.svg'),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0)),
                    boxShadow: [
                      BoxShadow(
                        color: xLogoDarkBlue.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 50,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                      child: Column(children: [
                        Row(children: [
                          Text('Recent',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(8, 19, 73, 1),
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                  height: 1))
                        ]),
                        SizedBox(height: 15),
                        Column(
                          children: [
                            HistoryItem(
                                name: 'John Albania',
                                time: '10 minutes ago',
                                status: true),
                            HistoryItem(
                                name: 'Kola Barrister',
                                time: '10 minutes ago',
                                status: false),
                            HistoryItem(
                                name: 'John Albania',
                                time: '10 minutes ago',
                                status: true)
                          ],
                        ),
                      ])))
            ])));
  }
}

class HistoryItem extends StatefulWidget {
  final String name;
  final String time;
  final bool status;
  const HistoryItem(
      {Key? key, required this.name, required this.time, required this.status})
      : super(key: key);

  @override
  State<HistoryItem> createState() => _HistoryItem();
}

class _HistoryItem extends State<HistoryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            SvgPicture.asset('assets/vectors/listUserIcon.svg'),
            SizedBox(width: 10),
            Column(
              children: [
                Text(widget.name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(37, 61, 232, 1),
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                        height: 1)),
                Text(widget.time,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(118, 141, 255, 1),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1))
              ],
            ),
            Spacer(),
            Text(widget.status ? 'Active' : 'Inactive',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(37, 61, 232, 1),
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    height: 1))
          ],
        ));
  }
}
