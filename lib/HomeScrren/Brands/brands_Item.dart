

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../Theme/my_Theme.dart';
import '../../data/model/Response/GetallCategory/BrandSourceResponse.dart';

class BrandsItem extends StatelessWidget {
Data data;
BrandsItem({required this.data});
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(

                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.2,
                    fit: BoxFit.cover,
                    imageUrl: data.image??"",
                    placeholder: (context, url) => CircularProgressIndicator(
                      color: MyTheme.primary,

                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
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


    );;
  }
}
