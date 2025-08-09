



import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Category/Product_detils_screen.dart';
import 'package:e_commerce_app/Theme/my_Theme.dart';
import 'package:flutter/material.dart';

import '../data/model/Response/ProductResponse/ProductSourceResponse.dart';

class CategoryDeytilss extends StatelessWidget {
 Data data ;


 CategoryDeytilss({required this.data});
 @override
  Widget build(BuildContext context) {
    return  InkWell(
     onTap: (){
       Navigator.of(context).pushNamed(ProductDetilsScreen.routeName,
       arguments: data);

     },
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: MyTheme.primary,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              child: CachedNetworkImage(
                imageUrl: data.imageCover ?? "",
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data.title ?? "",
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                data.brand?.name ?? "",

              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data.price.toString()??''),
                  Image.asset(
                    'assets/images/add.png',
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

 }
}
