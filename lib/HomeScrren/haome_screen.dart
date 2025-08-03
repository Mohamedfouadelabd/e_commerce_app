import 'package:flutter/material.dart';

import '../Search/search_field.dart';
import 'BasicElement/basic_element.dart';
import 'CategoryFragment/category_fragment.dart';

class HomeScreen extends StatelessWidget {
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Categories',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // Expanded wrapping only one scrollable ListView
        Expanded(
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => CategoryFragment(),
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => CategoryFragment(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
