import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/constants/global_context.dart';
import 'package:safari/controller/providers/search_screen_provider.dart';

class PlaceCategory extends StatelessWidget {
  const PlaceCategory({Key? key}) : super(key: key);

  showCategories(String category,int index,int selectedIndex) {
      return TextButton(
          onPressed: () {
            Provider.of<SearchScreenProvider>(GlobalContext.contextKey.currentContext!, listen: false)
                .setSelectedIndex(index);
          },
          child: Text(
            category,
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


  @override
  Widget build(BuildContext context) {
    final List<String> categories =
        Provider.of<SearchScreenProvider>(context).getCategories;
    final int selectedIndex =
        Provider.of<SearchScreenProvider>(context).getSelectedIndex;
    return Container(
      padding: const EdgeInsets.only(right: 10),
      height: displayHeight(context) * 0.06,
      width: displayWidth(context),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return showCategories(categories[index],index,selectedIndex);
        },
        itemCount: categories.length,
      ),
    );
  }
}
