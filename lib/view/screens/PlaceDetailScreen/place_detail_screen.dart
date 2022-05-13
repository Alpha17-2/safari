import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/places_provider.dart';
import 'package:safari/model/place_model.dart';
import 'package:safari/view/screens/PlaceDetailScreen/image_preview.dart';

class PlaceDetailScreen extends StatelessWidget {
  final String? id;
  PlaceDetailScreen({this.id});
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final PlaceModel place =
        Provider.of<PlacesProvider>(context).getPlaceUsingId(id!);
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
                ImagePreview(
                  myUid: currentUser!.uid,
                  placeId: place.id,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: SizedBox(
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
                            fontSize: 15,
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
