import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/places_provider.dart';
import 'package:safari/controller/providers/search_screen_provider.dart';
import 'package:safari/model/place_model.dart';
import 'package:safari/view/viewModels/PlaceUI.dart';
import 'package:safari/view/viewModels/favourite_place.dart';

class PlaceList extends StatelessWidget {
  final String myUid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    final List<String> categories =
        Provider.of<SearchScreenProvider>(context).getCategories;
    final int selectedIndex =
        Provider.of<SearchScreenProvider>(context).getSelectedIndex;

    final List<PlaceModel> list = Provider.of<PlacesProvider>(context)
        .getPlaceType(categories[selectedIndex]);
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return PlaceUI(myUid: myUid, place: list[index]);
      },
    );
  }
}
