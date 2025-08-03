import 'package:e_commerce_app/Theme/my_theme.dart';
import 'package:flutter/material.dart';

class FavoriteDetilsItem extends StatelessWidget {
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color:Colors.blue,
                  ),

                  child: Image.asset(
                    'assets/images/img_1.png',
                    height: MediaQuery.of(context).size.height * 0.16,

                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                   margin: EdgeInsets.all(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('GUESS Women’s'),
                         SizedBox(
                           width:MediaQuery.of(context).size.width*0.09 ,
                         ),
                          Image.asset(
                            'assets/images/img_2.png',
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                        ],
                      ),
                    ),
                    Container(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Black color'),
                          SizedBox(
                            width:MediaQuery.of(context).size.width*0.2 ,
                          ),
                          Container(
                           height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            color: MyTheme.Black
                            ),

                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('EGP 1,200'),
                          SizedBox(
                            width:MediaQuery.of(context).size.width*0.09 ,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height*0.05,
                            width:MediaQuery.of(context).size.width*0.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: MyTheme.primary
                            ),
child: Center(
  child:   Text('Add to Cart',

  style: Theme.of(context).textTheme.bodySmall!.copyWith(

    color: MyTheme.White





  ),



  ),
),
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
