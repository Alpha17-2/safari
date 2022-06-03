import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:safari/controller/constants/custom_colors.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/model/place_model.dart';
import 'package:shimmer/shimmer.dart';

import 'favourite_place.dart';

class PlaceUI extends StatelessWidget {
  final PlaceModel place;
  final String myUid;
  PlaceUI({required this.myUid, required this.place});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 6),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: displayHeight(context) * 0.35,
          width: displayWidth(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: place.images[0],
                    height: displayHeight(context) * 0.31,
                    width: displayWidth(context) * 0.85,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, progress) =>
                        Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            CustomColors.primary),
                      ),
                    ),
                  )),
              Positioned(
                  top: displayHeight(context) * 0.02,
                  right: displayWidth(context) * 0.06,
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: Card(
                      color: Colors.white,
                      child: IsFavouritePlace(placeId: place.id, myUid: myUid),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  )),
              Positioned(
                  bottom: displayWidth(context) * 0.05,
                  left: displayWidth(context) * 0.05,
                  child: Container(
                      padding: const EdgeInsets.only(
                          left: 6, right: 12, bottom: 2, top: 4),
                      height: displayHeight(context) * 0.068,
                      width: displayWidth(context) * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white.withOpacity(0.75),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: displayWidth(context) * 0.36,
                            child: Text(
                              place.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.5),
                            ),
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
                                size: 14,
                              ),
                              const VerticalDivider(
                                width: 2,
                              ),
                              SizedBox(
                                width: displayWidth(context) * 0.36,
                                child: Text(place.location,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 12,
                                    )),
                              ),
                            ],
                          )
                        ],
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
