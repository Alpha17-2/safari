import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/places_provider.dart';
import 'package:safari/model/place_model.dart';
import 'package:safari/view/viewModels/favourite_place.dart';

class ImagePreview extends StatelessWidget {
  final String? placeId;
  final String? myUid;

  ImagePreview({this.myUid, this.placeId});

  @override
  Widget build(BuildContext context) {
    final PlaceModel place =
        Provider.of<PlacesProvider>(context).getPlaceUsingId(placeId!);
    List<dynamic> networkImages = place.images;
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: displayHeight(context) * 0.5,
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
                    height: displayHeight(context) * 0.5,
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
              height: 45,
              width: 45,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      iconSize: 15,
                      icon: const Icon(Icons.arrow_back_ios_new)),
                ),
              ),
            )),
        Positioned(
            top: 10,
            right: 8,
            child: SizedBox(
                height: 45,
                width: 45,
                child: Card(
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: IsFavouritePlace(
                    myUid: myUid!,
                    placeId: placeId!,
                  ),
                ))),
      ],
    );
  }
}
