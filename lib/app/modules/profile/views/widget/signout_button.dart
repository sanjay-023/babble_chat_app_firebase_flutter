import 'package:babbleapp/app/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignoutButton extends StatelessWidget {
  const SignoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authServiceController = Get.put(AuthService());
    return ElevatedButton(
        onPressed: () {
          authServiceController.signOut();
          authServiceController.clearSharedprfns();
        },
        child: Text("Sign out"),
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 244, 4, 4),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            minimumSize: const Size(180, 40)));
  }
}
