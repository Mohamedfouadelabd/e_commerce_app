



import 'package:e_commerce_app/Theme/my_Theme.dart';
import 'package:flutter/material.dart';

class CategoryDeytilss extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
margin: EdgeInsets.all(2),
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
            borderRadius: BorderRadius.circular(0),
            child: Padding(
              padding: const EdgeInsets.only(

          bottom: 3
              ),
              child: Image.asset(
                  'assets/images/img.png',


              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Nike Air Jordon'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Nike Air Jordon'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Nike Air Jordon'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
 mainAxisAlignment: MainAxisAlignment.spaceBetween,
   children: [

     Text('Nike Air Jordon'),
     Image.asset(
       'assets/images/add.png',
height: MediaQuery.of(context).size.height*0.03,

     )
   ],


),
          ),
        ],
      ),
    );
  }
}
