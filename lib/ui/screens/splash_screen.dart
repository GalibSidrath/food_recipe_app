import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/ui/screens/home_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2), () {
      Get.off(const HomeScreen());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: Get.height * 0.5,
            width: Get.width * 0.5,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
