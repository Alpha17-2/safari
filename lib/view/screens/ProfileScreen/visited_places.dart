import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/visited_places_provider.dart';
import 'package:safari/model/visited_place_model.dart';

class VisitedPlaces extends StatelessWidget {
  ShowPlaces(BuildContext context, VisitedPlaceModel visitedPlaceModel) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Container(
        height: displayHeight(context) * 0.25,
        width: displayWidth(context),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                visitedPlaceModel.images[0],
                height: displayHeight(context) * 0.25,
                width: displayWidth(context) * 0.4,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  visitedPlaceModel.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 15),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  visitedPlaceModel.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,
                  style: const TextStyle(
                      //fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: 12.5),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '${visitedPlaceModel.location}, ${visitedPlaceModel.dateTime.day} ${months[visitedPlaceModel.dateTime.month]} ${visitedPlaceModel.dateTime.year}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      //fontWeight: FontWeight.w400,
                      color: Colors.red[600],
                      fontSize: 12),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Map<int, String> months = {
    1: 'January',
    2: 'February',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'August',
    9: 'September',
    10: 'October',
    11: 'November',
    12: 'December',
  };

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
          child: ShowPlaces(context, visitedPlaces[index]),
        );
      },
    );
  }
}
