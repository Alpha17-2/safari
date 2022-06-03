import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/places_provider.dart';
import 'package:safari/model/place_model.dart';
import 'package:safari/view/screens/PlaceDetailScreen/place_detail_screen.dart';
import 'package:safari/view/viewModels/PlaceUI.dart';

class LikedPlacesScreen extends StatelessWidget {
  //const LikedPlacesScreen({Key? key}) : super(key: key);

  final String myUid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    final List<PlaceModel> likedPlaces =
        Provider.of<PlacesProvider>(context).getLikedPlaces(myUid);
    return SizedBox(
        height: displayHeight(context),
        width: displayWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16.0, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Liked Places',
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.favorite,
                    size: 20,
                    color: Colors.teal,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: likedPlaces.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlaceDetailScreen(id: likedPlaces[index].id),
                          ));
                    },
                    child: PlaceUI(myUid: myUid, place: likedPlaces[index]));
              },
            )),
          ],
        ));
  }
}
