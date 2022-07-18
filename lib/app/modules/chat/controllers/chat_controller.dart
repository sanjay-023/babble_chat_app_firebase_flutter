import 'package:babbleapp/app/data/function/constants.dart';
import 'package:babbleapp/app/data/function/database.dart';
import 'package:babbleapp/app/modules/search/controllers/search_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

final gdatabaseController = Get.put(DatabaseMethod());
final gsearchController = Get.put(SearchController());

class ChatController extends GetxController {
  final chatTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    gdatabaseController.getConversationMessages(gsearchController.chatroomId!);
  }

  void sendMessage() {
    if (chatTextController.text.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        "message": chatTextController.text,
        "sendby": Constants.myName,
        "time": DateTime.now().millisecondsSinceEpoch
      };
      gdatabaseController.addConversationMessages(
          gsearchController.chatroomId!, messageMap);
    }
  }
}
