//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
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
      var response =
          await Provider.of<PlacesProvider>(context, listen: false).setPlaces();
      if (response.toString() == 'no internet') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('No Internet Connection'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ));
        await Future.delayed(const Duration(seconds: 2));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AppScreen(),
            ));
      } else {
        if(mounted){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AppScreen(),
            ));
        }
        
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 20,
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
              height: displayHeight(context) * 0.04,
            ),
            const Center(child:  CircularProgressIndicator(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
