import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safari/controller/constants/custom_colors.dart';
import 'package:safari/controller/constants/device_size.dart';
import 'package:safari/controller/providers/auth_container_provider.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Safari',
            style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        Text(
          'Man cannot discover new oceans unless he has the courage to lose sight of the shore',
          style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 40,
        ),
        Center(
          child: SizedBox(
            width: displayWidth(context) * 0.4,
            height: displayHeight(context) * 0.05,
            child: MaterialButton(
              onPressed: () {
                Provider.of<AuthContainerProvider>(context, listen: false)
                    .setContainerIndexTo(newIndex: 2);
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: const Text(
                'Login',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: SizedBox(
            width: displayWidth(context) * 0.4,
            height: displayHeight(context) * 0.05,
            child: MaterialButton(
              onPressed: () {
                Provider.of<AuthContainerProvider>(context, listen: false)
                    .setContainerIndexTo(newIndex: 0);
              },
              color: CustomColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                'Register',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}
