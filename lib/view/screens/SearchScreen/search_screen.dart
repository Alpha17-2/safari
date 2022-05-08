import 'package:flutter/material.dart';
import 'package:safari/controller/constants/device_size.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context),
      width: displayWidth(context),
      color: Colors.redAccent,
    );
  }
}
