import 'package:flutter/material.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/view/viewModels/custom_textfield.dart';

class SearchScreen extends StatelessWidget {
  //const SearchScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context),
      width: displayWidth(context),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
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
        )
      ]),
    );
  }
}
