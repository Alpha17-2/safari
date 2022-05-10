import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/auth_container_provider.dart';
import 'package:safari/view/screens/Authentication/aut_container.dart';
import 'package:safari/view/screens/Authentication/login_container.dart';
import 'package:safari/view/screens/Authentication/register_container.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final List<dynamic> auth_containers = [
    RegisterContainer(),
    AuthContainer(),
    LoginContainer()
  ];

  @override
  Widget build(BuildContext context) {
    final int authContainerIndex =
        Provider.of<AuthContainerProvider>(context).getContainerIndex;
    return Scaffold(
        body: Container(
      height: displayHeight(context),
      width: displayWidth(context),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/auth.jpg',
              ),
              fit: BoxFit.cover)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: Container(
          decoration: BoxDecoration(color: Colors.black12.withOpacity(0.1)),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: displayHeight(context) * 0.4,
                  width: displayWidth(context),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(15)),
                  child: auth_containers[authContainerIndex]),
            ],
          ),
        ),
      ),
    ));
  }
}
