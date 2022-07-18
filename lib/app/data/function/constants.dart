import 'package:babbleapp/app/data/function/helper_functions.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants extends GetxController {
  static String myName = "";

  getUserInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final userName = sharedPreferences.getString(HelperFunction.userNameKey);
    myName = userName!;
    update();
  }

  getUsetInfoLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final userInfo = sharedPreferences.getString(HelperFunction.userNameKey);
    myName = userInfo!;
    update();
  }
}
