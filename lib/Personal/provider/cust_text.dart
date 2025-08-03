

import 'package:e_commerce_app/Theme/my_Theme.dart';
import 'package:flutter/material.dart';

class CustText extends StatelessWidget {
 String titel;
 CustText({required this.titel});
  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.only(
        left: 7
      ),
      child: Text(titel,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: MyTheme.primary

      ),

      ),
    );
  }
}
