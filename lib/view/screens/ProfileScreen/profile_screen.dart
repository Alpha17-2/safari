import 'package:flutter/material.dart';
import 'package:safari/controller/constants/device_size.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context),
      width: displayWidth(context),
      color: Colors.pinkAccent,
    );
  }
}
