import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/providers/places_provider.dart';
import 'package:safari/model/place_model.dart';

class IsFavouritePlace extends StatelessWidget {
  final String placeId;
  final String myUid;

  IsFavouritePlace({required this.placeId, required this.myUid});

  @override
  Widget build(BuildContext context) {
    final PlaceModel place =
        Provider.of<PlacesProvider>(context).getPlaceUsingId(placeId);
    bool loadIconStatus =
        Provider.of<PlacesProvider>(context).getIsSavingStatus;
    return LikeButton(
      size: 20,
      circleColor: const CircleColor(start: Colors.red, end: Colors.white),
      isLiked: (place.likedBy.contains(myUid)),
      onTap: (data) async {
        if (!loadIconStatus) {
          dynamic response =
              await Provider.of<PlacesProvider>(context, listen: false)
                  .toggleLikeOptionForPlace(placeId: placeId, myUid: myUid);
          if (response.toString() != 'OK') {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(response.toString())));
          } else {
            return true;
          }
        }
        return null;
      },
    );
  }
}
