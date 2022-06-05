import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/custom_colors.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/visited_places_provider.dart';
import 'package:safari/model/visited_place_model.dart';

class VisitedImagePreview extends StatelessWidget {
  final String? placeId;

  VisitedImagePreview({this.placeId});

  @override
  Widget build(BuildContext context) {
    final VisitedPlaceModel place = Provider.of<VisitedPlacesProvider>(context)
        .getVisitedPlaceUsingId(placeId!);
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
                    child: CachedNetworkImage(
                      imageUrl: i.toString(),
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              CustomColors.primary),
                        ),
                      ),
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
      ],
    );
  }
}
