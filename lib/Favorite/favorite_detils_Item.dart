import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Theme/my_theme.dart';
import 'package:e_commerce_app/firebase/my_item.dart';
import 'package:flutter/material.dart';

import '../firebase/fire_base_utils.dart';

class FavoriteDetilsItem extends StatelessWidget {
  final MyItem myItem;
  FavoriteDetilsItem({required this.myItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        border: Border.all(width: 2, color: MyTheme.primary),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Colors.blue,
                ),
                child: CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.2,
                  imageUrl: myItem.imageUrl ?? "",
                  placeholder: (context, url) => CircularProgressIndicator(
                    color: MyTheme.primary,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(width: 8), // مسافة بسيطة بين الصورة والنصوص
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              myItem.titel ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 30,
                            ),
                            onPressed: () {
                              FireBaseUtils.getAllCollection()
                                  .doc(myItem.id)
                                  .delete();
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              myItem.brands ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: MyTheme.Black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              myItem.price ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: MyTheme.primary,
                            ),
                            child: Center(
                              child: Text(
                                'Add to Cart',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                  color: MyTheme.White,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
