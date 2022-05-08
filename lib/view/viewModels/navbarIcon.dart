import 'package:flutter/material.dart';

class NavbarIcon extends StatelessWidget {
  final IconButton? icon;
  bool? isSelected;
  NavbarIcon({this.icon, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected! ? Colors.white24 : Colors.transparent,
      ),
      child: icon,
    );
  }
}
