

import 'package:e_commerce_app/Favorite/favorite_detils_Item.dart';
import 'package:flutter/material.dart';

import '../Search/search_field.dart';

class FavoriteScreen extends StatelessWidget {
  var searchcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.08,
        ),
        Row(
          children: [
            Expanded(
                flex: 9,
                child: SearchField(
                  keyboardType: TextInputType.name,
                  controller: searchcontroller,
                  validator: (text){},

                )),
            Expanded(
                flex: 1,
                child: Image.asset('assets/images/car.png')),       ],
        ),
      Expanded(
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
          return FavoriteDetilsItem();
        },),
      )
      ],

    );
  }
}
