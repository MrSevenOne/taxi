import 'dart:async';
import 'package:flutter/material.dart';
import 'package:taxi/core/config/routes.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 3 soniya kutish va keyin Signup sahifasiga o‘tish
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.signup);
    });

    return Scaffold(
      backgroundColor: Colors.blue, // Splash Screen fonini o‘zgartirish mumkin
      body: Center(
        child: Text(
          'Taksi Xizmatiga Xush Kelibsiz!',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
