import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
 static const String routeName='register';


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
