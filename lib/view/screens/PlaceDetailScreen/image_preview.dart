import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/custom_colors.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/places_provider.dart';
import 'package:safari/model/place_model.dart';

class ImagePreview extends StatelessWidget {
  final String? placeId;
  final String? myUid;

  ImagePreview({this.myUid, this.placeId});

  @override
  Widget build(BuildContext context) {
    final PlaceModel place =
        Provider.of<PlacesProvider>(context).getPlaceUsingId(placeId!);
    List<dynamic> networkImages = place.images;
    bool loadIconStatus =
        Provider.of<PlacesProvider>(context).getIsSavingStatus;
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: displayHeight(context) * 0.4,
            aspectRatio: 0.8,
            autoPlay: true,
            initialPage: 0,
            viewportFraction: 1,
          ),
          items: networkImages.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return SizedBox(
                    width: displayWidth(context),
                    height: displayHeight(context) * 0.4,
                    child: Image.network(
                      i.toString(),
                      fit: BoxFit.cover,
                    ));
              },
            );
          }).toList(),
        ),
        Positioned(
            top: 10,
            left: 8,
            child: SizedBox(
              height: 55,
              width: 55,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new)),
                ),
              ),
            )),
        Positioned(
            top: 10,
            right: 8,
            child: SizedBox(
              height: 55,
              width: 55,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: LikeButton(
                  circleColor:
                      const CircleColor(start: Colors.red, end: Colors.white),
                  isLiked: (place.likedBy.contains(myUid)),
                  onTap: (data) async {

                    if (!loadIconStatus) {
                      dynamic response = await Provider.of<PlacesProvider>(
                              context,
                              listen: false)
                          .toggleLikeOptionForPlace(
                              placeId: placeId!, myUid: myUid!);
                      if (response.toString() != 'OK') {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(response.toString())));
                      } else {
                        return true;
                      }
                    }
                    return null;
                  },
                )),
              ),
            )),
      ],
    );
  }
}
