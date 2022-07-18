import 'package:babbleapp/app/data/function/database.dart';
import 'package:babbleapp/app/modules/chat/views/widget/chat_list_widget.dart';
import 'package:babbleapp/app/modules/login/views/widget/text_box_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  final chatController = Get.put(ChatController());
  final databaseController = Get.put(DatabaseMethod());

  @override
  Widget build(BuildContext context) {
    print(databaseController.messageList);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 19, 18, 18),
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 9, 121, 13),
            title: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(Get.arguments.toString().capitalizeFirst!)
              ],
            )),
        body: Stack(
          children: [
            ChatMessageListWidget(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 10),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    TextBoxWidget(
                        textBoxController: chatController.chatTextController,
                        hText: "Enter message"),
                    SizedBox(width: 3),
                    InkWell(
                      onTap: () {
                        chatController.sendMessage();
                        chatController.chatTextController.clear();
                      },
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Color.fromARGB(255, 5, 145, 9),
                        child: Icon(Icons.send),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
