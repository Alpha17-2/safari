import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safari/controller/constants/cutom_icons.dart';
import 'package:safari/controller/constants/device_size.dart';

class PopularCategories extends StatelessWidget {
  final List<Map<String, String>> popularCategories = [
    {'type': 'Mountain', 'icon': CustomIcons.mountainIcon},
    {'type': 'Mall', 'icon': CustomIcons.mallIcon},
    {'type': 'Park', 'icon': CustomIcons.parkIcon},
    {'type': 'Lake', 'icon': CustomIcons.lakeIcon},
    {'type': 'Beach', 'icon': CustomIcons.beachIcon},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.pink,
      height: displayHeight(context) * 0.15,
      width: displayWidth(context),
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: popularCategories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: displayWidth(context) * 0.1,
                    backgroundColor: Colors.grey[200],
                    backgroundImage:
                        AssetImage(popularCategories[index]['icon']!),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Expanded(
                    child: Text(
                      popularCategories[index]['type']!,
                      style:
                          GoogleFonts.aldrich(color: Colors.teal, fontSize: 15),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
