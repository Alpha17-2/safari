import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/providers/user_provider.dart';
import 'package:safari/model/user_model.dart';

class EditName extends StatelessWidget {
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UserModel? user = Provider.of<UserProvider>(context).getUser;
    return AlertDialog(
      content: TextFormField(
        controller: titleController,
        decoration: InputDecoration(
          hintText: user!.title,
        ),
      ),
      title: const Text('Edit name'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
            )),
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () async {
            dynamic response =
                await Provider.of<UserProvider>(context, listen: false)
                    .setNewTitle(title: titleController.text);
            if (response.runtimeType == String && response.toString() == 'OK') {
              // do nothing
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(response.toString())));
            }
            Navigator.pop(context);
          },
          color: Colors.green,
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
