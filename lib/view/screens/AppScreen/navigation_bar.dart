import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/custom_colors.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/current_screen_provider.dart';
import 'package:safari/view/viewModels/navbarIcon.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentScreen =
        Provider.of<CurrentScreenProvider>(context).getCurrentScreen;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: CustomColors.primary,
      ),
      height: displayHeight(context) * 0.08,
      width: displayWidth(context) * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavbarIcon(
            icon: IconButton(
              onPressed: () =>
                  Provider.of<CurrentScreenProvider>(context, listen: false)
                      .changeScreen(index: 0),
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            isSelected: currentScreen == 0,
          ),
          NavbarIcon(
            icon: IconButton(
              onPressed: () =>
                  Provider.of<CurrentScreenProvider>(context, listen: false)
                      .changeScreen(index: 1),
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            isSelected: currentScreen == 1,
          ),
          NavbarIcon(
            icon: IconButton(
              onPressed: () =>
                  Provider.of<CurrentScreenProvider>(context, listen: false)
                      .changeScreen(index: 2),
              icon: const Icon(
                Icons.favorite_border_outlined,
                color: Colors.white,
              ),
            ),
            isSelected: currentScreen == 2,
          ),
          NavbarIcon(
            icon: IconButton(
              onPressed: () =>
                  Provider.of<CurrentScreenProvider>(context, listen: false)
                      .changeScreen(index: 3),
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            isSelected: currentScreen == 3,
          ),
        ],
      ),
    );
  }
}
