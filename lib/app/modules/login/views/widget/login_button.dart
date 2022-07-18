import 'package:babbleapp/app/data/services/auth_service.dart';
import 'package:babbleapp/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authServiceController = Get.put(AuthService());
    final loginController = Get.put(LoginController());
    return ElevatedButton(
        onPressed: () {
          authServiceController.logInWithEmail(
              loginController.emailController.text,
              loginController.passwordController.text);
        },
        child: Text("Log in"),
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 10, 124, 35),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            minimumSize: const Size(150, 40)));
  }
}
