import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resident/Screens/add_code_screen.dart';
import 'package:resident/Screens/history_screen.dart';
import 'package:resident/Screens/home_screen.dart';
import 'package:resident/Screens/login_screen.dart';
import 'package:resident/Screens/messages_screen.dart';
import 'package:resident/Screens/profile_screen.dart';

import 'constants.dart';

class BottomNavBar extends StatefulWidget {
  final int currentScreen;

  const BottomNavBar({
    Key? key,
    required this.currentScreen,
  }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState(currentScreen);
}

class _BottomNavBarState extends State<BottomNavBar> {
  final tabs = [
    HomeScreen(),
    HistoryScreen(),
    AddCodeScreen(),
    MessagesScreen(),
    ProfileScreen()
  ];

  _BottomNavBarState(int currentScreen);

  late int screen;

  @override
  void initState() {
    super.initState();
    setState(() {
      screen = widget.currentScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;

    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: tabs[widget.currentScreen],
          bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: xColorDarkBlue.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: xColorDarkBlue,
                selectedIconTheme: IconThemeData(
                  color: xColorDarkBlue,
                ),
                currentIndex: screen,
                onTap: (index) {
                  setState(() {
                    screen = index;
                  });
                },
                elevation: 5,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/vectors/home.svg',
                      color: xColorDarkBlue,
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/vectors/home.svg',
                      color: xColorDarkBlue,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/vectors/cherrytomato 1.svg',
                      ),
                      activeIcon: SvgPicture.asset(
                        'assets/vectors/cherrytomato 1.svg',
                        color: xColorDarkBlue,
                      ),
                      label: 'Farm'),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.visibility,
                      color: Colors.transparent,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/vectors/vendor.svg',
                      ),
                      activeIcon: SvgPicture.asset(
                        'assets/vectors/vendor.svg',
                        color: xColorDarkBlue,
                      ),
                      label: 'Vendors'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/vectors/benefits.svg',
                      ),
                      activeIcon: SvgPicture.asset(
                        'assets/vectors/benefits.svg',
                        color: xColorDarkBlue,
                      ),
                      label: 'Benefits'),
                ],
              )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: keyboardIsOpened
              ? null
              : GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        //builder: (context) => ProductReportScreen(),
                        builder: (context) => LoginScreen(),
                      ),
                    );

                    //final data = await Barras.scan(context);

                    //var _scannedCode = data ?? "";
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: xColorDarkBlue.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      // onTap: () async {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       //builder: (context) => ProductReportScreen(),
                      //       builder: (context) => ScanScreen(),
                      //     ),
                      //   );
                      //
                      //   //final data = await Barras.scan(context);
                      //   //var _scannedCode = data ?? "";
                      // },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 42,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/vectors/verifyproducts.svg',
                              ),
                              Text(
                                'Scan Tags',
                                style: TextStyle(
                                    fontSize: 10, color: xColorDarkBlue),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ),
        onWillPop: () async {
          if (widget.currentScreen == 0) {
            return await showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                        title: Text('Exit App'),
                        content: Text('Are you sure you want to exit the app?'),
                        actions: <Widget>[
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: xColorDarkBlue),
                              onPressed: () {
                                // Navigator.of(context).pop(true);
                                SystemNavigator.pop();
                              },
                              child: Text('Yes')),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: xColorDarkBlue),
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Text('No'))
                        ]));
          } else {
            setState(() {
              screen = 0;
            });

            return await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          }
        });
  }
}
