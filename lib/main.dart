import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/providers/auth_container_provider.dart';
import 'package:safari/controller/providers/current_screen_provider.dart';
import 'package:safari/controller/providers/places_provider.dart';
import 'package:safari/view/screens/Authentication/auth_screen.dart';
import 'package:safari/view/screens/SplashScreen/splash_screen.dart';

void main() => runApp(const SafariApp());

class SafariApp extends StatelessWidget {
  const SafariApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthContainerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CurrentScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PlacesProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthenticationScreen(),
      ),
    );
  }
}
