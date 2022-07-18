import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DatabaseMethod extends GetxController {
  // List messageList = [];
  List messageList = [];

  createChatRoom(String chatroomid, chatroomMap) {
    FirebaseFirestore.instance
        .collection("chatroom")
        .doc(chatroomid)
        .set(chatroomMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  addConversationMessages(String chatRoomId, messageMap) {
    FirebaseFirestore.instance
        .collection("chatroom")
        .doc(chatRoomId)
        .collection("chats")
        .add(messageMap)
        .catchError((e) {
      print(e.message);
      update();
    });
  }

  getConversationMessages(String chatRoomId) {
    FirebaseFirestore.instance
        .collection("chatroom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy("time")
        .where('message')
        .snapshots()
        .forEach((element) {
      messageList.clear();
      element.docs.map((DocumentSnapshot document) {
        Map a = document.data() as Map<String, dynamic>;
        messageList.add(a);
      }).toList();
      update();
    });
  }

  // getConversationMessages(String chatRoomId) async {
  //   var messageData = await FirebaseFirestore.instance
  //       .collection("chatroom")
  //       .doc(chatRoomId)
  //       .collection("chats")
  //       .get();

  //   messageList = List.from(
  //       messageData.docs.map((doc) => MessageModel.fromSnapshot(doc)));
  //   update();
  // }
}
