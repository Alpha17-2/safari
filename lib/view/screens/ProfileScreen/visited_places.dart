import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/providers/visited_places_provider.dart';
import 'package:safari/model/visited_place_model.dart';
import 'show_places.dart';

class VisitedPlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<VisitedPlaceModel> visitedPlaces =
        Provider.of<VisitedPlacesProvider>(context).getVisitedPlaces;
    return ListView.builder(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      itemCount: visitedPlaces.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: ShowPlace(visitedPlaceModel: visitedPlaces[index]),
        );
      },
    );
  }
}
