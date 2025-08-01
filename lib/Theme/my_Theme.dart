import 'package:flutter/material.dart';

class MyTheme{
static Color primary=Color(0xff004182);
static Color White=Color(0xffFFFFFF);
static Color Black=Color(0xff000000);

static ThemeData lightTheme=ThemeData(
  textTheme: TextTheme(
    titleMedium: TextStyle(
      color: MyTheme.White,
      fontWeight:FontWeight.w500,
fontSize: 18,
    ),
titleSmall:TextStyle(
  color: MyTheme.primary,
  fontWeight:FontWeight.bold,
  fontSize: 18,
),
    bodyMedium: TextStyle(
    color: MyTheme.primary,
    fontWeight:FontWeight.w500,
    fontSize: 18,
  ),
    bodySmall: TextStyle(
      color: MyTheme.primary,
      fontWeight:FontWeight.w500,
      fontSize: 14,
    ),

  ),
appBarTheme: AppBarTheme(
  color: Colors.transparent,
  elevation: 0,

)

);



}