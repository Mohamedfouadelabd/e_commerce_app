


import 'package:flutter/material.dart';
import '../HomeScrren/Search/search_field.dart';
import '../Theme/my_Theme.dart';
import 'category_detils.dart';

class CategoryScreen extends StatelessWidget {
  var searchcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(


      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.09,
        ),
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

        Expanded(
          child: GridView.builder(
            itemCount: 100,
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,mainAxisSpacing: 4,
              crossAxisSpacing: 5,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              return CategoryDeytilss();

            },

          ),
        ),

      ],

    );



  }
}
