import 'package:babbleapp/app/data/services/auth_service.dart';
import 'package:babbleapp/app/modules/onboard/views/widget/onboard_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
  @override
  Widget build(BuildContext context) {
    final authServiceController = Get.put(AuthService());
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 19, 18, 18),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 20),
        child: Column(
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Connect to Your",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Friends with",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Text(
                  "Babble",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 60,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 90,
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OnBoardButtonWidget(
                      buttonText: "Log in", onBoardButtonIndex: 1),
                  SizedBox(
                    height: 15,
                  ),
                  OnBoardButtonWidget(
                      buttonText: "Sign up", onBoardButtonIndex: 2),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign up with",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          await authServiceController.googleSignUp();
                        },
                        child: Image.asset(
                          "asset/images/googleLogo.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          "asset/images/facebooklogo.png",
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
