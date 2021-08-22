import 'package:flutter/material.dart';
import 'Screens/splash_screen.dart';
import 'Screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2)),
        builder: (context, AsyncSnapshot snapshot) {
          // Show splash screen while waiting for app resources to load:
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MainApp(screenToShow: SplashScreen());
          } else {
            return const MainApp(screenToShow: WelcomeScreen());
          }
        });
  }
}

class MainApp extends StatefulWidget {
  final Widget screenToShow;
  const MainApp({
    Key? key,
    required this.screenToShow,
  }) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Entree',
        home: widget.screenToShow);
  }
}
