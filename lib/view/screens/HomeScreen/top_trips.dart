import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/places_provider.dart';
import 'package:safari/model/place_model.dart';
import 'package:safari/view/screens/PlaceDetailScreen/place_detail_screen.dart';

class TopTrips extends StatelessWidget {
  viewPlaceTemplate(BuildContext context, PlaceModel place) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.grey, width: 0.05)),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: displayWidth(context) * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  place.images.first.toString(),
                  height: displayHeight(context) * 0.24,
                  width: displayWidth(context) * 0.5,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: displayWidth(context) * 0.36,
              child: Text(place.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    letterSpacing: 0.1,
                    color: Colors.teal[700],
                    fontSize: 15,
                  )),
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_pin,
                  color: Colors.black54,
                  size: 16,
                ),
                const VerticalDivider(
                  width: 5,
                ),
                SizedBox(
                  width: displayWidth(context) * 0.36,
                  child: Text(place.location,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<PlaceModel> places =
        Provider.of<PlacesProvider>(context).getTopTrips;
    return SizedBox(
        height: displayHeight(context) * 0.35,
        width: displayWidth(context),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PlaceDetailScreen(id: places[index].id),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: viewPlaceTemplate(context, places[index]),
              ),
            );
          },
          itemCount: places.length,
        ));
  }
}
