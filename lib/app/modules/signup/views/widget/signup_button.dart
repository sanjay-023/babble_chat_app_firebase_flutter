import 'package:babbleapp/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(SignupController());
    return ElevatedButton(
        onPressed: () {
          //signupController.isLoading = true;
          signupController.signMeup();
        },
        child: Text("Sign up"),
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 10, 124, 35),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            minimumSize: const Size(150, 40)));
  }
}
