import 'package:babbleapp/app/data/function/constants.dart';
import 'package:babbleapp/app/data/function/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final searchTextController = TextEditingController();
  QuerySnapshot? searchSnapshot;
  int? searchIndex;
  String? chatroomId;

  Future getUserByFName(String fName) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("firstname", isEqualTo: fName)
        .get()
        .then((value) {
      searchSnapshot = value;
      update();
    });
  }

  createChatROmmAndStartConvo(String chatUserName) {
    if (chatUserName != Constants.myName) {
      final databaseController = Get.put(DatabaseMethod());
      chatroomId = getChatRoomId(chatUserName, Constants.myName);
      update();
      final constController = Get.put(Constants());
      constController.getUserInfo();
      List<String?> chatUsers = [Constants.myName, chatUserName];
      Map<String, dynamic> chatRoomMap = {
        "users": chatUsers,
        "charroomid": chatroomId
      };
      databaseController.createChatRoom(chatUserName, chatRoomMap);
    } else {
      Fluttertoast.showToast(msg: "You cannot message yourself");
    }
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "${b}_$a";
    } else {
      return "${a}_$b";
    }
  }

  // changeSearchIndex(index) {
  //   searchIndex = index;
  //   update();
  // }
}
