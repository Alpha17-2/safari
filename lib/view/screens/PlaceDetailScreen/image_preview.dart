import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:safari/controller/constants/custom_colors.dart';
import 'package:safari/controller/constants/device_size.dart';

class ImagePreview extends StatelessWidget {
  final List<dynamic>? networkImages;

  ImagePreview({this.networkImages});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: displayHeight(context) * 0.4,
        aspectRatio: 0.8,
        autoPlay: true,
        initialPage: 0,
        viewportFraction: 1,
      ),
      items: networkImages!.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                SizedBox(
                    width: displayWidth(context),
                    height: displayHeight(context) * 0.4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        i.toString(),
                        fit: BoxFit.cover,
                      ),
                    )),
                Positioned(
                    top: 10,
                    left: 8,
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
                    )),
                Positioned(
                    top: 10,
                    right: 8,
                    child: Card(
                      color: CustomColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            )),
                      ),
                    )),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
