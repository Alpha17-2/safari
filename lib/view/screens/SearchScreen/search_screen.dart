import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/search_screen_provider.dart';
import 'package:safari/model/place_model.dart';
import 'package:safari/view/screens/SearchScreen/place_list.dart';

class SearchScreen extends StatelessWidget {
  //const SearchScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

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
                fontSize: 16,
                fontWeight: (selectedIndex == index)
                    ? FontWeight.bold
                    : FontWeight.w500),
          ));
    }

    return SizedBox(
      height: displayHeight(context),
      width: displayWidth(context),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: displayHeight(context) * 0.15,
          width: displayWidth(context),
          //color: Colors.black26,
          child: Center(
            child: SizedBox(
              height: displayHeight(context) * 0.08,
              width: displayWidth(context) * 0.9,
              child: Card(
                  color: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black45,
                          ),
                          border: InputBorder.none),
                    ),
                  )),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 10),
          //color: Colors.amber,
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
         Expanded(child: PlaceList())
      ]),
    );
  }
}
