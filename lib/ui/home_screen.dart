import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:elysian_app/ui/favorites_screen.dart';
import 'package:elysian_app/ui/profile_screen.dart';
import 'package:elysian_app/ui/search_screen.dart';
import 'package:elysian_app/ui/settings_screen.dart';
import 'package:elysian_app/ui/store_screen.dart';
import 'package:elysian_app/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 2;
  final screens = [
    FavoritesScreen(),
    SearchScreen(),
    StoreScreen(),
    SettingScreen(),
    ProfileScreen()
  ];
  final items = const <Widget>[
    Icon(
      Icons.favorite,
      size: 30,
    ),
    Icon(
      Icons.search,
      size: 30,
    ),
    Icon(
      Icons.home,
      size: 30,
    ),
    Icon(
      Icons.settings,
      size: 30,
    ),
    Icon(
      Icons.person,
      size: 30,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Elysian Store",
          style: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            gradient: LinearGradient(
                colors: [kSecundaryColorLight, kPrimaryColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        color: kPrimaryColor,
        backgroundColor: Colors.transparent,
        height: 60.0,
        index: index,
        items: items,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}
