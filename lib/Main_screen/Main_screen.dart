import 'package:e_commerce_app/Favorite/favorite_screen.dart';
import 'package:e_commerce_app/HomeScrren/haome_screen.dart';
import 'package:e_commerce_app/Personal/personal_screen.dart';

import 'package:e_commerce_app/Theme/my_Theme.dart';

import 'package:flutter/material.dart';

import '../Category/category_screen.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = 'Main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.White,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: MyTheme.primary),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/home.png'),
                size: 35,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/category_detils.png'),
                size: 35,
              ),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/favorite.png'),
                size: 35,
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/personal.png'),
                size: 35,
              ),
              label: 'Personal',
            ),
          ],
        ),
      ),
      body: taps[selectedIndex],
    );
  }

  List<Widget> taps = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    PersonalScreen(),
  ];
}
