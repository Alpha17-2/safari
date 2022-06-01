import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/providers/places_provider.dart';
import 'package:safari/model/place_model.dart';
import 'package:safari/view/viewModels/PlaceUI.dart';

class SearchPlaceList extends StatelessWidget {
  final String query;
  SearchPlaceList({required this.query});

  final String myUid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    List<PlaceModel> list =
        Provider.of<PlacesProvider>(context).getPlacesFromQuery(query);
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return PlaceUI(myUid: myUid, place: list[index]);
      },
    );
    ;
  }
}
