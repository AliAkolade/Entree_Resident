import 'package:resident/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: xColorDarkBlue,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  'assets/vectors/Splash_Screen_Bottom.svg',
                  fit: BoxFit.cover,
                )),
            Column(children: [
              const Spacer(),
              SvgPicture.asset('assets/vectors/Entree_Logo_No_Padding.svg'),
              Container(
                // color: Colors.red,
                color: Colors.transparent,
                child: Center(
                  child: AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) {
                      return Padding(
                        padding:
                            EdgeInsets.all(10.0 * animationController.value),
                        child: child,
                      );
                    },
                    child: Container(
                      child: null,
                    ),
                  ),
                ),
              ),
              const Spacer()
            ])
          ],
        ),
      ),
    );
  }
}
