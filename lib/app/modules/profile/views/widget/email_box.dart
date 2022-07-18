import 'package:babbleapp/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailBoxWidget extends StatelessWidget {
  EmailBoxWidget({
    Key? key,
  }) : super(key: key);
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color.fromARGB(94, 70, 69, 69),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(30, 0, 0, 0),
                    blurRadius: 6,
                    spreadRadius: 0.5)
              ]),
          child: ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.white,
              ),
              title: Text(
                profileController.userModel.email!,
                style: TextStyle(color: Colors.white),
              ))),
    );
  }
}
