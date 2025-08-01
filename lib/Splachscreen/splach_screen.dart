

import 'dart:async';

import 'package:e_commerce_app/Auth/register_screen.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatelessWidget {
  static const String routeName='splach';

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) =>  RegisterScreen()),
        );
      });
    });
    return Scaffold(
      body: Image.asset('assets/images/splash_screen.png',
      width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,

      ),

    );
  }
}
