import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/places_provider.dart';
import 'package:safari/model/place_model.dart';

class TopTrips extends StatelessWidget {
  const TopTrips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final List<PlaceModel> places =
    //     Provider.of<PlacesProvider>(context).getBeaches;
    return Container(
      height: displayHeight(context) * 0.35,
      width: displayWidth(context),
      //color: Colors.black45,
      child: Center(
        child: Image.asset(
          'assets/icons/explore.gif',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
