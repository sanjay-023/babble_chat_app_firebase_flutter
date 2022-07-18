import 'package:babbleapp/app/data/function/constants.dart';
import 'package:babbleapp/app/data/function/database.dart';
import 'package:babbleapp/app/modules/chat/controllers/chat_controller.dart';
import 'package:babbleapp/app/modules/search/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMessageListWidget extends StatelessWidget {
  ChatMessageListWidget({Key? key}) : super(key: key);

  final chatController = Get.put(ChatController());
  final databaseController = Get.put(DatabaseMethod());
  final searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: databaseController
            .getConversationMessages(searchController.chatroomId!),
        builder: (context, snapshot) {
          return GetBuilder<DatabaseMethod>(builder: (controller) {
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final data = databaseController.messageList;
                final dataAtIndex = data.elementAt(index);

                return Container(
                  padding:
                      EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 8),
                  width: MediaQuery.of(context).size.width,
                  alignment: dataAtIndex['sendby'] == Constants.myName
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                    decoration: BoxDecoration(
                        color: dataAtIndex['sendby'] == Constants.myName
                            ? Color.fromARGB(255, 42, 131, 45)
                            : Color.fromARGB(255, 83, 83, 83),
                        borderRadius: dataAtIndex['sendby'] == Constants.myName
                            ? BorderRadius.only(
                                topLeft: Radius.circular(23),
                                topRight: Radius.circular(23),
                                bottomLeft: Radius.circular(23))
                            : BorderRadius.only(
                                topLeft: Radius.circular(23),
                                topRight: Radius.circular(23),
                                bottomRight: Radius.circular(23))),
                    child: Text(
                      dataAtIndex['message'].toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                );
              },
              itemCount: databaseController.messageList.length,
            );
          });
        });
  }
}
