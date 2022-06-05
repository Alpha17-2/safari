import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/providers/visited_places_provider.dart';
import 'package:safari/model/visited_place_model.dart';
import 'package:safari/view/screens/ProfileScreen/Visited%20Place/VisitedPlaceDetail.dart';
import 'show_places.dart';

class VisitedPlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<VisitedPlaceModel> visitedPlaces =
        Provider.of<VisitedPlacesProvider>(context).getVisitedPlaces;
    return (visitedPlaces.isEmpty)
        ? const Center(
            child: Text(
              'Visit places and add your experience here !!',
              textAlign: TextAlign.center,
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            itemCount: visitedPlaces.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VisitedPlaceDetailScreen(
                                id: visitedPlaces[index].id),
                          ));
                    },
                    child: ShowPlace(visitedPlaceModel: visitedPlaces[index])),
              );
            },
          );
  }
}
