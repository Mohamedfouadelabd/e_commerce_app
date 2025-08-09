import 'package:e_commerce_app/Auth/Login/login_screen.dart';
import 'package:e_commerce_app/Auth/Register/register_screen.dart';
import 'package:e_commerce_app/Category/Product_detils_screen.dart';

import 'package:e_commerce_app/Main_screen/Main_screen.dart';
import 'package:e_commerce_app/Personal/provider/user_provider.dart';
import 'package:e_commerce_app/Splachscreen/splach_screen.dart';
import 'package:e_commerce_app/Theme/my_Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context) => UserProvider(),

      child: MyApp()));
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
debugShowCheckedModeBanner: false,
          theme: MyTheme.lightTheme,
          initialRoute: MainScreen.routeName,
          routes: {
  SplachScreen.routeName:(context) => SplachScreen(),
            RegisterScreen.routeName:(context) => RegisterScreen(),
         LoginScreen.routeName:(context) => LoginScreen(),
            MainScreen.routeName:(context) => MainScreen(),
            ProductDetilsScreen.routeName:(context) => ProductDetilsScreen(),
          },

        );
      },

    );
  }
}