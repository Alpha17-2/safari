import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/current_screen_provider.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => Provider.of<CurrentScreenProvider>(context, listen: false)
            .changeScreen(index: 1),
        child: SizedBox(
          height: displayHeight(context) * 0.08,
          width: displayWidth(context) * 0.9,
          child: Card(
            color: Colors.white,
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.search,
                    color: Colors.black45,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Search places...',
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
