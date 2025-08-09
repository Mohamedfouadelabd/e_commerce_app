import 'package:e_commerce_app/HomeScrren/Brands/brands_view.dart';
import 'package:e_commerce_app/Theme/my_Theme.dart';
import 'package:flutter/material.dart';
import 'BasicElement/basic_element.dart';
import 'Search/search_tap.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),

          BasicElement(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Categories',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'view all',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
// Expanded wrapping only one scrollable ListView
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: BrandsView(),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Brands',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'view all',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: BrandsView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
