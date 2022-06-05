import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/cutom_icons.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/current_screen_provider.dart';
import 'package:safari/controller/providers/search_screen_provider.dart';

class PopularCategories extends StatelessWidget {
  final List<Map<String, dynamic>> popularCategories = [
    {'type': 'Mountain', 'icon': CustomIcons.mountainIcon, 'index': 1},
    {'type': 'Mall', 'icon': CustomIcons.mallIcon, 'index': 2},
    {'type': 'Park', 'icon': CustomIcons.parkIcon, 'index': 3},
    {'type': 'Lake', 'icon': CustomIcons.lakeIcon, 'index': 5},
    {'type': 'Beach', 'icon': CustomIcons.beachIcon, 'index': 6},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: displayHeight(context) * 0.15,
      width: displayWidth(context),
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: popularCategories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: InkWell(
                onTap: () {
                  Provider.of<SearchScreenProvider>(context, listen: false)
                      .setSelectedIndex(popularCategories[index]['index']!);
                  Provider.of<CurrentScreenProvider>(context, listen: false)
                      .changeScreen(index: 1);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: displayWidth(context) * 0.08,
                      backgroundColor: Colors.grey[200],
                      backgroundImage:
                          AssetImage(popularCategories[index]['icon']!),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Text(
                        popularCategories[index]['type']!,
                        style: GoogleFonts.aldrich(
                            color: Colors.teal, fontSize: 14),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
