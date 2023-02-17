import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  var currentIndex = 0.obs;
}

class TabbarPage {
  const TabbarPage(this.index, this.title, this.icon, this.page);
  final int index;
  final String title;
  final IconData icon;
  final Widget page;
}
