import 'package:flutter/material.dart';
import 'package:safari/controller/constants/device_size.dart';

class LikedPlacesScreen extends StatelessWidget {
  const LikedPlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context),
      width: displayWidth(context),
      child: Center(
        child: Text('This screen is under development'),
      ),
    );
  }
}
