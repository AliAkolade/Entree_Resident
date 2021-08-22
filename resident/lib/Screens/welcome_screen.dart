import 'package:resident/Screens/signup_screen.dart';
import 'package:resident/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: xColorDarkBlue,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.asset('assets/vectors/OnBoard_Screen_Bottom.svg',
                    fit: BoxFit.fill),
              ],
            ),
            Positioned(
                bottom: 1,
                right: 1,
                left: 1,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        // borderRadius: BorderRadius.all(Radius.circular(20))
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0),
                        )),
                    // color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.max,
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Your Gateway to a Secure Lifestyle',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(8, 19, 73, 1),
                                fontFamily: 'Poppins',
                                fontSize: 30,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w700,
                                height: 1),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'A Revolutionalized means of granting access.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(116, 124, 172, 1),
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w400,
                                height: 1),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Spacer(),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: BorderSide(
                                                  color: xLogoDarkBlue))),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              xLogoDarkBlue)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  },
                                  child: // Figma Flutter Generator EnterWidget - TEXT
                                      Text(
                                    'ENTER',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.w700,
                                        height: 1),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ))),
          ],
        ));
  }
}
