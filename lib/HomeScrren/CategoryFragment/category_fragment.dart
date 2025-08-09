
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Theme/my_Theme.dart';
import 'package:flutter/material.dart';

import '../../data/model/Response/GetallCategory/CategoryResponse.dart';

class CategoryFragment extends StatelessWidget {
 CategoryFragment({required this.data});
Data data ;
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
        child:Image.network(data.image??"",)

      ),
    ),

    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(data.name??"",
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: MyTheme.primary,
        fontSize:15

      ),

      ),
    )

  ],
),



      ],


    );
  }
}
/*



 */
/*
CachedNetworkImage(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.2,
          fit: BoxFit.cover,
          imageUrl: data.image??"",
          placeholder: (context, url) => CircularProgressIndicator(
            color: MyTheme.primary,

          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
 */