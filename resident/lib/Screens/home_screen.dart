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
          backgroundColor: Colors.white,
          leadingWidth: 100,
          leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  IconButton(
                      icon: SvgPicture.asset('assets/vectors/menu.svg'),
                      tooltip: 'Profile',
                      onPressed: () {})
                ],
              )),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                  icon: SvgPicture.asset('assets/vectors/profileAvatar.svg'),
                  tooltip: 'Menu',
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
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              shadowColor: xLogoDarkBlue,
              elevation: 50,
              color: xLogoDarkBlue,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
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
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          )
        ])));
  }
}
