import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/search_screen_provider.dart';
import 'package:safari/model/place_model.dart';
import 'package:safari/view/screens/PlaceDetailScreen/place_detail_screen.dart';
import 'package:safari/view/screens/SearchScreen/place_list.dart';
import 'package:safari/view/screens/SearchScreen/search_place_list.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //const SearchScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  StreamController<bool> isTypingController = StreamController();

  @override
  void dispose() {
    searchController.dispose();
    isTypingController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categories =
        Provider.of<SearchScreenProvider>(context).getCategories;
    final int selectedIndex =
        Provider.of<SearchScreenProvider>(context).getSelectedIndex;

    showCategories(int index) {
      return TextButton(
          onPressed: () {
            Provider.of<SearchScreenProvider>(context, listen: false)
                .setSelectedIndex(index);
          },
          child: Text(
            categories[index],
            style: TextStyle(
                color: (selectedIndex == index)
                    ? Colors.teal[400]
                    : Colors.black54,
                fontSize: 14,
                fontWeight: (selectedIndex == index)
                    ? FontWeight.bold
                    : FontWeight.w500),
          ));
    }

    return SizedBox(
        height: displayHeight(context),
        width: displayWidth(context),
        child: StreamBuilder<bool>(
          initialData: false,
          stream: isTypingController.stream,
          builder: (context, snapshot) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: displayHeight(context) * 0.12,
                    width: displayWidth(context),
                    child: Center(
                      child: SizedBox(
                        height: displayHeight(context) * 0.08,
                        width: displayWidth(context) * 0.9,
                        child: Card(
                            color: Colors.white,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: displayWidth(context) * 0.7,
                                  child: TextFormField(
                                    controller: searchController,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        isTypingController.add(true);
                                        debugPrint('typing...');
                                      } else {
                                        isTypingController.add(false);
                                        debugPrint('typing stopped');
                                      }
                                    },
                                    decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: Colors.black45,
                                        ),
                                        border: InputBorder.none),
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                      onPressed: () {
                                        isTypingController.add(false);
                                        debugPrint('typing stopped');
                                        searchController.clear();
                                      },
                                      icon: const Icon(Icons.close)),
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    height: displayHeight(context) * 0.06,
                    width: displayWidth(context),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return showCategories(index);
                      },
                      itemCount: categories.length,
                    ),
                  ),
                  Expanded(
                      child: snapshot.data ?? false
                          ? SearchPlaceList(query: searchController.text)
                          : PlaceList())
                ]);
          },
        ));
  }
}
