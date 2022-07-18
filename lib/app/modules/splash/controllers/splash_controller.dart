import 'package:babbleapp/app/modules/authentication/views/authentication_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {}
  // void increment() => count.value++;

  Future<void> gotoOnBoard() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(AuthenticationView());
  }
}
