

import 'package:e_commerce_app/HomeScrren/Search/search_tap.dart';
import 'package:flutter/material.dart';

import '../Theme/my_Theme.dart';
import 'Cubit/product_view.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search for the product',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchTap());
              },
              icon: Icon(
                Icons.search,
                size: 40,
                color: MyTheme.primary,
              ))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Expanded(child: ProductView())
        ],
      ),
    );
  }
}
/*
,
 */
