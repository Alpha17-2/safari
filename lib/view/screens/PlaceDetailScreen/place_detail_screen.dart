import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/custom_colors.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/places_provider.dart';
import 'package:safari/model/place_model.dart';
import 'package:safari/view/screens/PlaceDetailScreen/image_preview.dart';

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
          padding: const EdgeInsets.all(12),
          //color: Colors.red[200],
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImagePreview(networkImages: place.images),
                const SizedBox(height: 20),
                SizedBox(
                  child: Text(
                    place.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.teal[400]!,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      child: Text(
                        place.location,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black45,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  place.description,
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      letterSpacing: 0.15,
                      wordSpacing: 0.15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
