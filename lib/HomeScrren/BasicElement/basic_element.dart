
import 'package:e_commerce_app/HomeScrren/BasicElement/my_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicElement extends StatelessWidget {
  List<String> sliderImage = [
    MyAssets.photo1,
    MyAssets.photo2,
    MyAssets.photo3

  ];

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(

      width: double.infinity,
isLoop:  true,
    

autoPlayInterval: 3000,
      initialPage: 0,
indicatorBottomPadding: 20.h,

      indicatorColor: Colors.transparent,

      indicatorBackgroundColor: Colors.transparent,
      children: sliderImage.map((imagePath) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          width: 398.w,
     height: 200.h,
          ),
        );
      }).toList(),




    );
  }
}




