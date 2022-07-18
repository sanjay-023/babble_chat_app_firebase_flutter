import 'package:babbleapp/app/modules/login/views/login_view.dart';
import 'package:babbleapp/app/modules/signup/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardButtonWidget extends StatelessWidget {
  OnBoardButtonWidget(
      {Key? key, required this.buttonText, required this.onBoardButtonIndex})
      : super(key: key);
  final String buttonText;
  final int onBoardButtonIndex;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onBoardButtonIndex == 1 ? Get.to(LoginView()) : Get.to(SignupView());
        },
        child: Text(buttonText),
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 4, 146, 37),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            minimumSize: const Size(280, 60)));
  }
}
