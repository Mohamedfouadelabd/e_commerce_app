import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName='lohin';


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/sign.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        )


      ],
    );
  }
}
