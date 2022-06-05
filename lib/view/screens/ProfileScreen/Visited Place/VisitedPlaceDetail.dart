import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/visited_places_provider.dart';

import 'package:safari/model/visited_place_model.dart';
import 'package:safari/view/screens/ProfileScreen/Visited%20Place/visted_image_preview.dart';

class VisitedPlaceDetailScreen extends StatelessWidget {
  final String? id;
  VisitedPlaceDetailScreen({this.id});
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final VisitedPlaceModel place =
        Provider.of<VisitedPlacesProvider>(context).getVisitedPlaceUsingId(id!);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: SizedBox(
          height: displayHeight(context),
          width: displayWidth(context),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VisitedImagePreview(
                  placeId: place.id,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: SizedBox(
                    child: Text(
                      place.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.teal[400]!,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        child: Text(
                          place.location,
                          style: const TextStyle(
                            fontSize: 12.5,
                            color: Colors.black45,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Text(
                    place.description,
                    style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        letterSpacing: 0.15,
                        wordSpacing: 0.15),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
