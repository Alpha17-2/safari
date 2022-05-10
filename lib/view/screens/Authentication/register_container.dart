import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/auth_container_provider.dart';
import 'package:safari/view/viewModels/custom_textfield.dart';

class RegisterContainer extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    Provider.of<AuthContainerProvider>(context, listen: false)
                        .setContainerIndexTo(newIndex: 1);
                  },
                  iconSize: 30,
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                )
              ],
            ),
            const SizedBox(height: 15),
            CustomTextField(
                obscureText: false,
                label: "Email address",
                maxlines: 1,
                controller: emailController),
            const SizedBox(height: 15),
            CustomTextField(
                obscureText: true,
                label: "Password",
                maxlines: 1,
                controller: passwordController),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: displayWidth(context) * 0.6,
                height: displayHeight(context) * 0.06,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
