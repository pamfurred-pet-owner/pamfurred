import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pamfurred/components/globals.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyTabbedWidget());
  }
}

class MyTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Today'),
    const Tab(text: 'Upcoming'),
    const Tab(text: 'All'),
    const Tab(text: 'Done'),
    const Tab(text: 'Cancelled'),
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

class MyTabbedWidget extends StatelessWidget {
  const MyTabbedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MyTabController tabx = Get.put(MyTabController());
    // ↑ init tab controller

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        bottom: TabBar(
          splashFactory: NoSplash.splashFactory,
          controller: tabx.controller,
          tabs: tabx.myTabs,
        ),
      ),
      body: TabBarView(
        controller: tabx.controller,
        children: tabx.myTabs.map((Tab tab) {
          final String label = tab.text!;
          return Center(
            child: Text(
              label,
              style: const TextStyle(fontSize: regularText),
            ),
          );
        }).toList(),
      ),
    );
  }
}
