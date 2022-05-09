import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/view/screens/HomeScreen/popular_categories.dart';
import 'package:safari/view/screens/HomeScreen/search_card.dart';
import 'package:safari/view/screens/HomeScreen/top_trips.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context),
      width: displayWidth(context),
      color: Colors.white,
      padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: displayWidth(context) * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Discover',
                    style: GoogleFonts.inder(
                        fontWeight: FontWeight.bold,
                        fontSize: displayWidth(context) * 0.1,
                        color: Colors.teal),
                  ),
                  Text(
                    'the beauty today',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: displayWidth(context) * 0.042,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const SearchCard(),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Popular categories',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: displayWidth(context) * 0.06,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            PopularCategories(),
            const SizedBox(height: 20),
            Text(
              'Top trips',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: displayWidth(context) * 0.06,
                  fontWeight: FontWeight.w600),
            ),
            const TopTrips(),
          ],
        ),
      ),
    );
  }
}
