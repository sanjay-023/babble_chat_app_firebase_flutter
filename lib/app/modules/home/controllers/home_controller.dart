import 'package:babbleapp/app/data/function/constants.dart';
import 'package:babbleapp/app/data/function/helper_functions.dart';
import 'package:babbleapp/app/data/model/user_model.dart';
import 'package:babbleapp/app/modules/profile/controllers/profile_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

final gprofileController = Get.put(ProfileController());
final gconstCOntroller = Get.put(Constants());

class HomeController extends GetxController {
  UserModel userModel = UserModel();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future getData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      userModel = UserModel.fromMap(value.data());
      update();
      HelperFunction.saveUserName(userModel.firstName);
      gconstCOntroller.getUsetInfoLogin();
      update();
    });
  }
}
