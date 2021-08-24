import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resident/Screens/add_code_screen.dart';
import 'package:resident/Screens/history_screen.dart';
import 'package:resident/Screens/home_screen.dart';
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
            body: tabs[screen],
            bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(bottom: 0, left: 0, right: 0),
                child: Container(
                    child: BottomNavigationBar(
                  unselectedLabelStyle: TextStyle(fontSize: 10),
                  selectedLabelStyle: TextStyle(fontSize: 12),
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: xLogoDarkBlue,
                  selectedItemColor: xLogoDarkBlue,
                  unselectedIconTheme: IconThemeData(color: xLogoDarkBlue),
                  selectedIconTheme: IconThemeData(color: xLogoDarkBlue),
                  currentIndex: screen,
                  onTap: (index) {
                    setState(() {
                      screen = index;
                    });
                  },
                  elevation: 0,
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/vectors/home.svg',
                      ),
                      activeIcon: SvgPicture.asset(
                        'assets/vectors/activeHome.svg',
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/vectors/history.svg',
                        ),
                        activeIcon: SvgPicture.asset(
                          'assets/vectors/activeHistory.svg',
                        ),
                        label: 'History'),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/vectors/createCode.svg',
                        ),
                        label: '',
                        tooltip: 'Add Code'),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/vectors/messages.svg',
                        ),
                        activeIcon: SvgPicture.asset(
                          'assets/vectors/activeMessages.svg',
                        ),
                        label: 'Messages'),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/vectors/profile.svg',
                        ),
                        activeIcon: SvgPicture.asset(
                          'assets/vectors/activeProfile.svg',
                        ),
                        label: 'Profile'),
                  ],
                )))),
        onWillPop: () async {
          if (screen == 0) {
            return await showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                        title: Text('Exit App'),
                        content: Text('Are you sure you want to exit the app?'),
                        actions: <Widget>[
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: xLogoDarkBlue),
                              onPressed: () {
                                // Navigator.of(context).pop(true);
                                SystemNavigator.pop();
                              },
                              child: Text('Yes')),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: xLogoDarkBlue),
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Text('No'))
                        ]));
          } else {
            setState(() {
              screen = 0;
            });
            return false;
          }
        });
  }
}
