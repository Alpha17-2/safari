import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/visited_places_provider.dart';
import 'display_image.dart';

class PickedImages extends StatelessWidget {
  final picker = ImagePicker();
  Future pickImages(BuildContext context) async {
    List<XFile>? pickedImages = [];
    pickedImages = await picker.pickMultiImage();
    if (pickedImages != null && pickedImages.isNotEmpty) {
      Provider.of<VisitedPlacesProvider>(context, listen: false)
          .setPickedImages(pickedImages);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('No images selected')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<XFile> pickedImages =
        Provider.of<VisitedPlacesProvider>(context).getPickedImages;
    return Container(
      //color: Colors.amber,
      height: displayHeight(context) * 0.16,
      width: displayWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: displayWidth(context) * 0.06,
            backgroundColor: Colors.grey[100],
            child: IconButton(
              onPressed: () async {
                await pickImages(context);
              },
              icon: const Icon(Icons.add),
              color: Colors.teal,
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return DisplayImage(
                  file: pickedImages[index],
                  index: index,
                );
              },
              itemCount: pickedImages.length,
            ),
          ),
        ],
      ),
    );
  }
}
