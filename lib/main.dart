import 'package:e_commerce_app/Auth/Login/login_screen.dart';
import 'package:e_commerce_app/Auth/Register/register_screen.dart';
import 'package:e_commerce_app/Home_Screen/home_screen.dart';
import 'package:e_commerce_app/Splachscreen/splach_screen.dart';
import 'package:e_commerce_app/Theme/my_Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
theme: MyTheme.lightTheme,
          initialRoute: SplachScreen.routeName,
          routes: {
  SplachScreen.routeName:(context) => SplachScreen(),
            RegisterScreen.routeName:(context) => RegisterScreen(),
         LoginScreen.routeName:(context) => LoginScreen(),
            HomeScreen.routeName:(context) => HomeScreen(),
          },

        );
      },

    );
  }
}