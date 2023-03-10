import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes_app_gdcs/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 850))
      ..forward(); //make instance first and forward it
    animation =
        CurvedAnimation(curve: Curves.easeInToLinear, parent: controller);
    //after animation go to a next page directly
    Timer(
        const Duration(milliseconds: 2000),
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            )));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: animation,
              child: Center(
                child: Image.asset(
                  'assets/images/splash_screen.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
