import 'package:babbleapp/app/data/services/auth_service.dart';
import 'package:babbleapp/app/modules/login/views/widget/text_box_widget.dart';
import 'package:babbleapp/app/modules/signup/views/widget/signup_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    final authServiceController = Get.put(AuthService());
    final signupController = Get.put(SignupController());
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 19, 18, 18),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GetBuilder<SignupController>(builder: (controller) {
        return signupController.isLoading == true
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 36,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Create an account',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextBoxWidget(
                          textBoxController:
                              authServiceController.fNameController,
                          hText: "Enter your first name"),
                      SizedBox(
                        height: 15,
                      ),
                      TextBoxWidget(
                          textBoxController:
                              authServiceController.lNameController,
                          hText: "Enter your last name"),
                      SizedBox(
                        height: 15,
                      ),
                      TextBoxWidget(
                          textBoxController:
                              authServiceController.emailController,
                          hText: "Enter your email"),
                      SizedBox(
                        height: 15,
                      ),
                      TextBoxWidget(
                          textBoxController:
                              authServiceController.signupPasswordController,
                          hText: "Enter password",
                          passwordBoxIndex: 1),
                      SizedBox(
                        height: 15,
                      ),
                      TextBoxWidget(
                          textBoxController:
                              authServiceController.confirmPasswordController,
                          hText: "Confirm password",
                          passwordBoxIndex: 1),
                      SizedBox(
                        height: 15,
                      ),
                      SignupButton()
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
