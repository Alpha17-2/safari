import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/places_provider.dart';
import 'package:safari/model/place_model.dart';

class PlaceDetailScreen extends StatelessWidget {
  final String? id;
  PlaceDetailScreen({this.id});

  @override
  Widget build(BuildContext context) {
    final PlaceModel place =
        Provider.of<PlacesProvider>(context).getPlaceUsingId(id!);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: Container(
          height: displayHeight(context),
          width: displayWidth(context),
          color: Colors.red[200],
        ),
      ),
    );
  }
}
