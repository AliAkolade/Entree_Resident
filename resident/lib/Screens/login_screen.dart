import 'package:resident/Utils/bottom_nav_bar.dart';
import 'package:resident/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  bool obscurePass = true;
  late TextEditingController myController = new TextEditingController(text: "");
  late TextEditingController passController =
      new TextEditingController(text: "");
  Color emailColor = Color.fromRGBO(40, 49, 103, 1);
  Color passColor = Color.fromRGBO(40, 49, 103, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: xColorDarkBlue,
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: SvgPicture.asset(
                        'assets/vectors/Entree_Logo_Without_Text.svg',
                        height: 30,
                      )),
                ],
              ),
              Expanded(
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(20.0),
                            topRight: const Radius.circular(20.0),
                          )),
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 22, top: 15),
                                    child: Text(
                                      'Welcome Back ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(8, 19, 73, 1),
                                          fontFamily: 'Poppins',
                                          fontSize: 30,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold,
                                          height: 1),
                                    )),
                                Spacer()
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 22),
                                  child: Theme(
                                    data: ThemeData(
                                      focusColor:
                                          Color.fromRGBO(40, 49, 103, 1),
                                      primaryColor:
                                          Color.fromRGBO(40, 49, 103, 1),
                                      primaryColorDark:
                                          Color.fromRGBO(40, 49, 103, 1),
                                      primaryColorLight:
                                          Color.fromRGBO(40, 49, 103, 1),
                                      accentColor:
                                          Color.fromRGBO(40, 49, 103, 1),
                                    ),
                                    child: Focus(
                                        onFocusChange: (hasFocus) {
                                          setState(() => emailColor = hasFocus
                                              ? xLogoLightBlue
                                              : const Color.fromRGBO(
                                                  40, 49, 103, 1));
                                        },
                                        child: TextField(
                                          cursorColor:
                                              Color.fromRGBO(40, 49, 103, 1),
                                          controller: myController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                              focusedBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: xColorDarkBlue),
                                              ),
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Color.fromRGBO(
                                                              40, 49, 103, 1))),
                                              prefixIcon: const Icon(
                                                Icons.email_outlined,
                                                color: xLogoLightBlue,
                                              ),
                                              suffixIcon: const Icon(
                                                Icons.check,
                                                color: xLogoDarkBlue,
                                              ),
                                              fillColor: Colors.transparent,
                                              contentPadding: EdgeInsets.all(3),
                                              filled: true,
                                              labelText: '   Email Address',
                                              labelStyle: TextStyle(
                                                color: myController.text == ''
                                                    ? emailColor
                                                    : xLogoLightBlue,
                                                fontFamily: 'Poppins',
                                                fontSize: 20,
                                              )),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 22,
                                  ),
                                  child: Theme(
                                    data: ThemeData(
                                      primaryColor:
                                          Color.fromRGBO(40, 49, 103, 1),
                                      primaryColorDark:
                                          Color.fromRGBO(40, 49, 103, 1),
                                      primaryColorLight:
                                          Color.fromRGBO(40, 49, 103, 1),
                                    ),
                                    child: Focus(
                                        onFocusChange: (hasFocus) {
                                          setState(() => passColor = hasFocus
                                              ? xLogoLightBlue
                                              : Color.fromRGBO(40, 49, 103, 1));
                                        },
                                        child: TextField(
                                          cursorColor: xColorDarkBlue,
                                          controller: passController,
                                          obscureText: obscurePass,
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.lock_outline,
                                                color: xLogoLightBlue,
                                              ),
                                              suffixIcon: IconButton(
                                                color: xLogoLightBlue,
                                                icon: obscurePass
                                                    ? Icon(Icons
                                                        .visibility_off_outlined)
                                                    : Icon(Icons
                                                        .visibility_outlined),
                                                onPressed: () {
                                                  setState(() {
                                                    obscurePass = !obscurePass;
                                                  });
                                                },
                                              ),
                                              fillColor: Colors.transparent,
                                              contentPadding: EdgeInsets.all(3),
                                              filled: true,
                                              focusedBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: xColorDarkBlue),
                                              ),
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Color.fromRGBO(
                                                              40, 49, 103, 1))),
                                              labelText: '   Password',
                                              labelStyle: TextStyle(
                                                color: passController.text == ''
                                                    ? passColor
                                                    : xLogoLightBlue,
                                                fontFamily: 'Poppins',
                                                fontSize: 20,
                                              )),
                                        )),
                                  ),
                                ),
                                SizedBox(height: 30),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             LoginScreen()));
                                            },
                                            child: // Figma Flutter Generator ForgotpasswordWidget - TEXT
                                                Text(
                                              'Forgot Password?',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      37, 61, 232, 1),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 14,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1),
                                            ))
                                      ],
                                    )),
                              ],
                            ),
                            SizedBox(height: 30),
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
                                              BottomNavBar(currentScreen: 0)));
                                },
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Text(
                                      'Log In',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          fontFamily: 'Poppins',
                                          fontSize: 20,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.w700,
                                          height: 1),
                                    )))
                          ],
                        ),
                      )))
            ])));
  }
}
