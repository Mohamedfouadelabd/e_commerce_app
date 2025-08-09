import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Theme/my_theme.dart';
import 'package:flutter/material.dart';

import '../../data/model/Response/GetallCategory/BrandSourceResponse.dart';

class SearchItem extends StatelessWidget {
  Data data;
  SearchItem ({required this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            border: Border.all(width: 2, color: MyTheme.primary)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                clipBehavior: Clip.antiAlias,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color:Colors.blue,
                  ),

                  child:CachedNetworkImage(
                    height:MediaQuery.of(context).size.height * 0.16,

                    imageUrl: data.image??"",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Container(
                      padding: EdgeInsets.all(7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(data.name??""),
                          SizedBox(
                            width:MediaQuery.of(context).size.width*0.09 ,
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
