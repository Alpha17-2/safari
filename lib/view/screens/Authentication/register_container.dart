import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/firebase_services/auth_services.dart';
import 'package:safari/controller/providers/auth_container_provider.dart';
import 'package:safari/view/viewModels/custom_textfield.dart';

class RegisterContainer extends StatefulWidget {
  @override
  State<RegisterContainer> createState() => _RegisterContainerState();
}

class _RegisterContainerState extends State<RegisterContainer> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final Authservice _auth = Authservice(FirebaseAuth.instance);

  bool loadScreen = false;

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
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    Provider.of<AuthContainerProvider>(context, listen: false)
                        .setContainerIndexTo(newIndex: 1);
                  },
                  iconSize: 25,
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                )
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: displayHeight(context) * 0.07,
              child: CustomTextField(
                  obscureText: false,
                  label: "Email address",
                  maxlines: 1,
                  borderColor: Colors.white,
                  textColor: Colors.white,
                  controller: emailController),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: displayHeight(context) * 0.07,
              child: CustomTextField(
                  obscureText: true,
                  label: "Password",
                  maxlines: 1,
                  borderColor: Colors.white,
                  textColor: Colors.white,
                  controller: passwordController),
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: displayWidth(context) * 0.6,
                height: displayHeight(context) * 0.06,
                child: MaterialButton(
                  onPressed: () async {
                    setState(() {
                      loadScreen = true;
                    });
                    var response = await _auth.signUp(
                        email: emailController.text,
                        password: passwordController.text,
                        context: context);
                    if (mounted) {
                      setState(() {
                        loadScreen = false;
                      });
                    }

                    if (response != 'valid') {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(response.toString())));
                    }
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: (loadScreen)
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text(
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
