import 'package:flutter/material.dart';
import 'package:safari/controller/constants/calender_constants.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/model/visited_place_model.dart';

class ShowPlace extends StatelessWidget {
  final VisitedPlaceModel visitedPlaceModel;

  ShowPlace({required this.visitedPlaceModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Container(
        height: displayHeight(context) * 0.25,
        width: displayWidth(context),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                visitedPlaceModel.images[0],
                height: displayHeight(context) * 0.25,
                width: displayWidth(context) * 0.4,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    visitedPlaceModel.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: displayHeight(context) * 0.15,
                  child: Text(
                    visitedPlaceModel.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 7,
                    style:
                        const TextStyle(color: Colors.black54, fontSize: 12.5),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '${visitedPlaceModel.location}, ${visitedPlaceModel.dateTime.day} ${CalenderConstant.months[visitedPlaceModel.dateTime.month]} ${visitedPlaceModel.dateTime.year}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      //fontWeight: FontWeight.w400,
                      color: Colors.red[600],
                      fontSize: 12),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
