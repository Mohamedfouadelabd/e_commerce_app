import 'package:e_commerce_app/HomeScrren/Brands/brands_view.dart';
import 'package:e_commerce_app/HomeScrren/Cubit/home_screen_view.dart';

import 'package:e_commerce_app/Theme/my_Theme.dart';
import 'package:flutter/material.dart';
import 'BasicElement/basic_element.dart';
import 'Search/search_field.dart';


class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.08),

        Row(
          children: [
            Expanded(
              flex: 9,
              child: SearchField(
                keyboardType: TextInputType.name,
                controller: searchcontroller,
                validator: (text) {},
              ),
            ),
            Expanded(
              flex: 1,
              child: Image.asset('assets/images/car.png'),
            ),
          ],
        ),




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
                child: HomeScreenView(),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: HomeScreenView(),
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
    );
  }
}

