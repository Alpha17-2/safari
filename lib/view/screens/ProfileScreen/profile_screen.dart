import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/firebase_services/auth_services.dart';
import 'package:safari/controller/providers/places_provider.dart';
import 'package:safari/controller/providers/user_provider.dart';
import 'package:safari/controller/providers/visited_places_provider.dart';
import 'package:safari/model/user_model.dart';
import 'package:safari/model/visited_place_model.dart';
import 'package:safari/view/screens/ProfileScreen/editName.dart';
import '../Authentication/auth_screen.dart';
import 'Visited Place/new_visited_place.dart';
import 'Visited Place/visited_places.dart';

class ProfileScreen extends StatelessWidget {
  final Authservice _auth = Authservice(FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    final bool isUserFetched =
        Provider.of<UserProvider>(context).getIsUserFetched!;
    final UserModel? user = Provider.of<UserProvider>(context).getUser;
    final List<VisitedPlaceModel> visitedPlacesList =
        Provider.of<VisitedPlacesProvider>(context).getVisitedPlaces;
    return SizedBox(
      height: displayHeight(context),
      width: displayWidth(context),
      child: (isUserFetched)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/profile_cover.jpg'),
                            fit: BoxFit.cover)),
                    height: displayHeight(context) * 0.16,
                    width: displayWidth(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 45,
                          width: 45,
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            color: Colors.white.withOpacity(0.75),
                            child: IconButton(
                              iconSize: 20,
                              icon: const Icon(Icons.logout),
                              onPressed: () {
                                _auth.signOut().then((value) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const AuthenticationScreen(),
                                      ));
                                });
                              },
                              color: Colors.black54,
                            ),
                          ),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: displayWidth(context) * 0.1,
                        backgroundImage:
                            const AssetImage('assets/images/profile_cover.jpg'),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            user!.title!,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                                fontSize: 16,
                                letterSpacing: 0.05),
                          ),
                          IconButton(
                              iconSize: 18,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return EditName();
                                    });
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.teal,
                              ))
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.white,
                                isScrollControlled: true,
                                constraints: BoxConstraints.loose(Size(
                                    MediaQuery.of(context).size.width,
                                    MediaQuery.of(context).size.height * 0.75)),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15))),
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).padding.top),
                                    child: NewVisitedPlace(),
                                  );
                                });
                          },
                          icon: const Icon(Icons.add),
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: displayWidth(context) * 0.55,
                    height: displayHeight(context) * 0.08,
                    child: Card(
                      color: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Visited',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  visitedPlacesList.length.toString(),
                                  style: const TextStyle(
                                      color: Colors.black38,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Liked',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  Provider.of<PlacesProvider>(context,
                                          listen: false)
                                      .getLikedPlaces(user.id!)
                                      .length
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.black38,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Expanded(child: VisitedPlaces()),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(
                  height: 10,
                ),
                Text('Loading profile'),
              ],
            ),
    );
  }
}
