import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

import '../components/globals.dart';

class MyTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Widget> myTabs = <Widget>[
    Tab(
      child: badges.Badge(
        position: badges.BadgePosition.topEnd(top: -5),
        showBadge: true,
        badgeStyle: const badges.BadgeStyle(badgeColor: tangerine),
        child: const Text('Today'),
      ),
    ),
    Tab(
      child: badges.Badge(
        position: badges.BadgePosition.topEnd(top: -5),
        showBadge: true,
        badgeStyle: const badges.BadgeStyle(badgeColor: tangerine),
        child: const Text('Upcoming'),
      ),
    ),
    Tab(
      child: badges.Badge(
        position: badges.BadgePosition.topEnd(top: -5),
        showBadge: true,
        badgeStyle: const badges.BadgeStyle(badgeColor: tangerine),
        child: const Text('All'),
      ),
    ),
    Tab(
      child: badges.Badge(
        position: badges.BadgePosition.topEnd(top: -5),
        showBadge: true,
        badgeStyle: const badges.BadgeStyle(badgeColor: tangerine),
        child: const Text('Done'),
      ),
    ),
    Tab(
      child: badges.Badge(
        position: badges.BadgePosition.topEnd(top: -5),
        showBadge: true,
        badgeStyle: const badges.BadgeStyle(badgeColor: tangerine),
        child: const Text('Cancelled'),
      ),
    ),
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
