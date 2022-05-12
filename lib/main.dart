import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/firebase_services/auth_services.dart';
import 'package:safari/controller/providers/auth_container_provider.dart';
import 'package:safari/controller/providers/current_screen_provider.dart';
import 'package:safari/controller/providers/firebase_user_provider.dart';
import 'package:safari/controller/providers/places_provider.dart';
import 'package:safari/controller/providers/user_provider.dart';
import 'package:safari/view/screens/Authentication/auth_screen.dart';
import 'package:safari/view/screens/SplashScreen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const SafariApp());
}

class SafariApp extends StatelessWidget {
  const SafariApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => AuthNotifier(),
          ),
          Provider<Authservice>(
              create: (_) => Authservice(FirebaseAuth.instance)),
          StreamProvider(
            create: (context) => context.read<Authservice>().austhStateChanges,
            initialData: null,
          ),
        ChangeNotifierProvider(
          create: (context) => AuthContainerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CurrentScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PlacesProvider(),
        ),
        ChangeNotifierProvider(create: (context) => UserProvider(),)
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  Consumer<AuthNotifier>(
              builder: (context, notifier, child) {
                return notifier.user != null ? const SplashScreen() : const Wrapper();
              },
            ),
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const SplashScreen();
    } else {
      return const AuthenticationScreen();
    }
  }
}
