import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/custom_colors.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/places_provider.dart';
import 'package:safari/view/screens/AppScreen/app_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    setup();
    super.initState();
  }

  setup() async {
    if (mounted) {
      await Provider.of<PlacesProvider>(context, listen: false).setPlaces();
      if (mounted) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AppScreen(),
            ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 40,
          left: 16,
        ),
        height: displayHeight(context),
        width: displayWidth(context),
        color: CustomColors.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Safari',
              style: GoogleFonts.inder(
                  fontSize: displayWidth(context) * 0.15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              'Something to be written soon...',
              style: TextStyle(
                  fontSize: displayWidth(context) * 0.05, color: Colors.white),
            ),
            SizedBox(
              height: displayHeight(context) * 0.1,
            ),
            Image.asset(
              'assets/images/splash.png',
              height: displayHeight(context) * 0.35,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: displayHeight(context) * 0.1,
            ),
            const Center(child: CircularProgressIndicator(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
