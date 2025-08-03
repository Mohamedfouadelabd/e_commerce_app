

import 'package:flutter/material.dart';

import '../Theme/my_Theme.dart';

class CustContinar extends StatelessWidget {
  String description;
  CustContinar({required this.description});
  @override
  Widget build(BuildContext context) {
    return    Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(7),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: MyTheme.primary,
            width: 2


        ),

      ),
      child: Text(description,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: MyTheme.primary

        ),

      ),
    );
  }
}
