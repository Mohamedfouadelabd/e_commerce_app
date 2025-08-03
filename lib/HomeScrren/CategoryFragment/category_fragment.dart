
import 'package:e_commerce_app/Theme/my_Theme.dart';
import 'package:flutter/material.dart';

class CategoryFragment extends StatelessWidget {
  const CategoryFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/category.png',
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.2,
          fit: BoxFit.cover,
        ),
      ),
    ),

    Text('Beauty',
    style: Theme.of(context).textTheme.titleLarge!.copyWith(
      color: MyTheme.primary
    ),

    )

  ],
),



      ],


    );
  }
}
