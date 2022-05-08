import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/providers/current_screen_provider.dart';
import 'package:safari/view/screens/HomeScreen/home_screen.dart';
import 'package:safari/view/screens/LikedPlacesScreen/liked_places_screen.dart';
import 'package:safari/view/screens/ProfileScreen/profile_screen.dart';
import 'package:safari/view/screens/SearchScreen/search_screen.dart';
import 'navigation_bar.dart';

class AppScreen extends StatelessWidget {
  List<dynamic> appScreens = [
    HomeScreen(),
    SearchScreen(),
    LikedPlacesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    int currentScreen =
        Provider.of<CurrentScreenProvider>(context).getCurrentScreen;
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.center,
          children: [
            appScreens[currentScreen],
            const Positioned(bottom: 15, child: CustomNavigationBar()),
          ],
        ),
      ),
    );
  }
}
