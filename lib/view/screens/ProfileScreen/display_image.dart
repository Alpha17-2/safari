import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safari/controller/constants/device_size.dart';


class DisplayImage extends StatelessWidget {
  final XFile? file;
  final int? index;
  DisplayImage({this.file, this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(
              File(file!.path),
              fit: BoxFit.cover,
              //height: displayHeight(context) * 0.05,
              width: displayWidth(context) * 0.3,
            ),
          ),
        ),
        
      ],
    );
  }
}