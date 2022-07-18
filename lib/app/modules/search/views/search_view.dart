import 'package:babbleapp/app/modules/search/views/search_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  final searchController = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("New Chat"),
        ),
        backgroundColor: Color.fromARGB(255, 19, 18, 18),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            child: Column(children: [
              CupertinoTextField(
                onChanged: (value) {
                  searchController.getUserByFName(value);
                },
                controller: searchController.searchTextController,
                decoration: BoxDecoration(
                    color: Color.fromARGB(79, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10)),
                placeholder: "search",
                suffix: IconButton(
                    onPressed: () {
                      searchController.getUserByFName(
                          searchController.searchTextController.text);
                    },
                    icon: Icon(Icons.search)),
                placeholderStyle: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              GetBuilder<SearchController>(builder: (context) {
                return Expanded(
                  child: searchController.searchSnapshot == null
                      ? Container()
                      : SearchListWidget(),
                );
              })
            ]),
          ),
        ));
  }
}
