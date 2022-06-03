import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/calender_constants.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/visited_places_provider.dart';
import 'package:safari/view/screens/ProfileScreen/picked_images.dart';
import 'package:safari/view/viewModels/custom_textfield.dart';

class NewVisitedPlace extends StatefulWidget {
  @override
  State<NewVisitedPlace> createState() => _NewVisitedPlaceState();
}

class _NewVisitedPlaceState extends State<NewVisitedPlace> {
  final formKey = GlobalKey<FormState>();

  TextEditingController locationCtr = TextEditingController();

  TextEditingController titleCtr = TextEditingController();

  TextEditingController descriptionCtr = TextEditingController();

  TextEditingController dateCtr = TextEditingController();

  DateTime currentDate = DateTime.now();

  String myUid = FirebaseAuth.instance.currentUser!.uid;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != currentDate) {
      setState(() {
        currentDate = picked;
        dateCtr = TextEditingController(
            text:
                "${picked.day} ${CalenderConstant.months[picked.month]}, ${picked.year}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isPosting = Provider.of<VisitedPlacesProvider>(context).getIsPosting;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: (isPosting)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                        width: displayWidth(context) * 0.5,
                        child: const LinearProgressIndicator()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Adding new place')
                ],
              )
            : Form(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add New Visited Place',
                            style: TextStyle(
                                color: Colors.black87.withOpacity(0.75),
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          TextButton.icon(
                              onPressed: () async {
                                await Provider.of<VisitedPlacesProvider>(
                                        context,
                                        listen: false)
                                    .addVisitedPlace(
                                        title: titleCtr.text,
                                        myUid: myUid,
                                        location: locationCtr.text,
                                        dateTime: currentDate,
                                        description: descriptionCtr.text);
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.save),
                              label: const Text('Save'))
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.068,
                        child: CustomTextField(
                          controller: titleCtr,
                          label: 'Title',
                          maxlines: 1,
                          borderColor: Colors.black,
                          obscureText: false,
                          textColor: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        controller: descriptionCtr,
                        label: 'Description',
                        maxlines: 3,
                        borderColor: Colors.black,
                        obscureText: false,
                        textColor: Colors.black,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.068,
                        child: CustomTextField(
                          controller: locationCtr,
                          label: 'Location',
                          maxlines: 1,
                          borderColor: Colors.black,
                          obscureText: false,
                          textColor: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.068,
                        child: TextFormField(
                          onTap: () async {
                            _selectDate(context);
                          },
                          readOnly: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field cannot be empty';
                            }
                            return null;
                          },
                          controller: dateCtr,
                          decoration: InputDecoration(
                            focusColor: Colors.black,
                            labelText: "Date",
                            labelStyle: const TextStyle(color: Colors.black),
                            fillColor: Colors.black,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      PickedImages(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
