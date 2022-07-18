import 'package:babbleapp/app/modules/chat/views/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Get.to(ChatView());
          },
          leading: CircleAvatar(),
          title: Text(
            "User Name",
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            "Recent message",
            style: TextStyle(color: Colors.white),
          ),
          trailing: Text(
            "05:30 pm",
            style: TextStyle(color: Colors.white),
          ),
        );
      },
      itemCount: 10,
    );
  }
}
