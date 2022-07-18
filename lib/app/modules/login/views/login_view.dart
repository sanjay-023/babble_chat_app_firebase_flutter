import 'package:babbleapp/app/modules/login/views/widget/login_button.dart';
import 'package:babbleapp/app/modules/login/views/widget/text_box_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 19, 18, 18),
      body: SizedBox(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 60, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 44,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Back !",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 38,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                TextBoxWidget(
                    hText: "Enter your email",
                    textBoxController: loginController.emailController),
                SizedBox(
                  height: 15,
                ),
                TextBoxWidget(
                  hText: "Enter your password",
                  textBoxController: loginController.passwordController,
                  passwordBoxIndex: 1,
                ),
                SizedBox(
                  height: 15,
                ),
                LoginButtonWidget(),
                TextButton(
                    onPressed: () {
                      loginController.forgotPasswordPopUp();
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
