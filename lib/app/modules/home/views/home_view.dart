import 'package:babbleapp/app/data/function/constants.dart';
import 'package:babbleapp/app/modules/home/views/widget/list_widget.dart';
import 'package:babbleapp/app/modules/profile/controllers/profile_controller.dart';
import 'package:babbleapp/app/modules/profile/views/profile_view.dart';
import 'package:babbleapp/app/modules/search/views/search_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final profileController = Get.put(ProfileController());
  final homeController = Get.put(HomeController());
  final constController = Get.put(Constants());

  @override
  Widget build(BuildContext context) {
    print(Constants.myName);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Messages",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.normal),
            ),
          ),
          actions: [
            InkWell(
              onTap: () async {
                await profileController.getData();
                Get.to(ProfileView());
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: CircleAvatar(
                  radius: 14,
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(SearchView());
          },
          child: Icon(Icons.chat),
        ),
        backgroundColor: Color.fromARGB(255, 19, 18, 18),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            child: Column(children: [
              Expanded(
                flex: 3,
                child: ListWidget(),
              )
            ]),
          ),
        ));
  }
}
