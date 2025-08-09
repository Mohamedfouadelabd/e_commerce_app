import 'package:e_commerce_app/Favorite/favorite_detils_Item.dart';
import 'package:flutter/material.dart';

import '../HomeScrren/Search/search_tap.dart';
import '../Theme/my_Theme.dart';

class FavoriteScreen extends StatelessWidget {
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
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return FavoriteDetilsItem();
              },
            ),
          )
        ],
      ),
    );
  }
}
