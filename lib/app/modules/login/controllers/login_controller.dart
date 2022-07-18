import 'package:babbleapp/app/data/services/auth_service.dart';
import 'package:babbleapp/app/modules/login/views/widget/text_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgotPassemailController = TextEditingController();
  final authServiceController = Get.put(AuthService());

  forgotPasswordPopUp() {
    Get.defaultDialog(
        backgroundColor: Colors.black,
        title: "Forgot Password?",
        titlePadding: EdgeInsets.all(20),
        titleStyle: TextStyle(color: Colors.white),
        content: Column(
          children: [
            TextBoxWidget(
                textBoxController: forgotPassemailController,
                hText: "Enter your email"),
            SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  authServiceController
                      .resetPassword(forgotPassemailController.text);
                  Get.back();
                },
                child: Text("Submit"),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 10, 124, 35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    minimumSize: const Size(150, 40)))
          ],
        ),
        contentPadding: EdgeInsets.all(20));
  }
}
