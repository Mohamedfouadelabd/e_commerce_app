import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Favorite/favorite_detils_Item.dart';
import 'package:e_commerce_app/firebase/my_item.dart';
import 'package:flutter/material.dart';

import '../HomeScrren/Search/search_tap.dart';
import '../Theme/my_Theme.dart';
import '../firebase/fire_base_utils.dart';

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
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Expanded(
            child: StreamBuilder<QuerySnapshot<MyItem>>(
              stream: FireBaseUtils.getAllCollection().snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      'There was an error loading data.',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  );
                }

                var items = snapshot.data?.docs ?? [];

                if (items.isEmpty) {
                  return const Center(
                    child: Text(
                      'There are no movies in the watch list.',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  );
                }

                return ListView.separated(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    var currentItem = items[index].data();
                    return FavoriteDetilsItem(myItem: currentItem);
                  },
                  separatorBuilder: (context, index) => SizedBox(
                height: 3,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
