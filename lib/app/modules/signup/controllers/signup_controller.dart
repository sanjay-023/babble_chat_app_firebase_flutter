import 'package:babbleapp/app/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final authServiceController = Get.put(AuthService());

class SignupController extends GetxController {
  final authServiceController = Get.put(AuthService());
  bool isLoading = false;

  signMeup() {
    if (authServiceController.emailController.text.isNotEmpty ||
        authServiceController.signupPasswordController.text.isNotEmpty ||
        authServiceController.fNameController.text.isNotEmpty ||
        authServiceController.lNameController.text.isNotEmpty) {
      if (emailValidateFun() == true) {
        if (authServiceController.signupPasswordController.text.length >= 6) {
          if (authServiceController.signupPasswordController.text ==
              authServiceController.confirmPasswordController.text) {
            authServiceController.signUpwithemail(
                authServiceController.emailController.text,
                authServiceController.signupPasswordController.text);
          } else {
            showErrorSnack("Password does not match");
          }
        } else {
          showErrorSnack("Password should contain atleast 6 charecters");
        }
      } else {
        showErrorSnack("Enter a valid email");
      }
    } else {
      showErrorSnack("Required fields empty");
    }
  }

  showErrorSnack(String message) {
    Get.snackbar("", "",
        titleText: Text(
          "Signup Failed",
          style: TextStyle(color: Color.fromARGB(255, 245, 17, 1)),
        ),
        messageText: Text(
          message,
          style: TextStyle(color: Colors.white),
        ));
  }

  emailValidateFun() {
    final emailValide = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (emailValide.hasMatch(authServiceController.emailController.text)) {
      return true;
    }
  }

  changeLoadingStatus() {
    isLoading = true;
    update();
  }

  changeLoadingStatusToFalse() {
    isLoading = false;
    update();
  }
}
