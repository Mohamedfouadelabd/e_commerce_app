
import 'package:flutter/material.dart';

class BasicElement extends StatelessWidget {
  const BasicElement({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height*0.01,
          horizontal: MediaQuery.of(context).size.width*0.01,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)

        ),
        child: Image.asset('assets/images/main.png'));
  }
}
