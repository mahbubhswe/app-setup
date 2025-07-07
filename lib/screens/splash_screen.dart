import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../modules/auth/controllers/auth_controller.dart';
import '../modules/auth/screens/auth_screen.dart';
import '../modules/home/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/splash.json'),
      backgroundColor: Colors.white,
      nextScreen: Obx(() {
        if (authController.user.value != null) {
          return HomeScreen();
        } else {
          return AuthScreen();
        }
      }),
      splashIconSize: 200,
      duration: 2000,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: const Duration(milliseconds: 600),
    );
  }
}
