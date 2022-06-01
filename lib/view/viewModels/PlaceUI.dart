import 'package:flutter/material.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/model/place_model.dart';

import 'favourite_place.dart';

class PlaceUI extends StatelessWidget {
  final PlaceModel place;
  final String myUid;
  PlaceUI({required this.myUid,required this.place});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
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
                child: Image.network(
                  place.images[0],
                  height: displayHeight(context) * 0.31,
                  width: displayWidth(context) * 0.85,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  top: displayHeight(context) * 0.02,
                  right: displayWidth(context) * 0.06,
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Card(
                      color: Colors.white,
                      child: IsFavouritePlace(placeId: place.id, myUid: myUid),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  )),
              Positioned(
                  bottom: displayWidth(context) * 0.05,
                  child: Container(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, bottom: 4, top: 10),
                      height: displayHeight(context) * 0.085,
                      width: displayWidth(context) * 0.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.75),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            place.title,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
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
                                size: 18,
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
                                      fontSize: 14,
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
