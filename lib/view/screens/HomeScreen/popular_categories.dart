import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/cutom_icons.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/places_provider.dart';

class PopularCategories extends StatelessWidget {
  const PopularCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            InkWell(
              onTap: () async {
                var result = Provider.of<PlacesProvider>(context, listen: false)
                    .setPlaces();
              },
              child: CircleAvatar(
                radius: displayWidth(context) * 0.12,
                backgroundColor: Colors.grey[200],
                backgroundImage: const AssetImage(CustomIcons.beachIcon),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Beach',
              style: GoogleFonts.aldrich(color: Colors.teal, fontSize: 16),
            )
          ],
        ),
        Column(
          children: [
            CircleAvatar(
              radius: displayWidth(context) * 0.12,
              backgroundColor: Colors.grey[200],
              backgroundImage: const AssetImage(CustomIcons.parkIcon),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Parks',
              style: GoogleFonts.aldrich(color: Colors.teal, fontSize: 16),
            )
          ],
        ),
        Column(
          children: [
            CircleAvatar(
              radius: displayWidth(context) * 0.12,
              backgroundColor: Colors.grey[200],
              backgroundImage: const AssetImage(CustomIcons.museumIcon),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Museums',
              style: GoogleFonts.aldrich(color: Colors.teal, fontSize: 16),
            )
          ],
        ),
      ],
    );
  }
}
