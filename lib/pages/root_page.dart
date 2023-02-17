import 'package:flutter/material.dart';
import 'package:flutter_getx_demo/controller/root_controller.dart';
import 'package:flutter_getx_demo/pages/tabbar/home.dart';
import 'package:flutter_getx_demo/pages/tabbar/im.dart';
import 'package:flutter_getx_demo/pages/tabbar/project.dart';
import 'package:flutter_getx_demo/pages/tabbar/tool.dart';
import 'package:get/get.dart';

class RootPage extends StatelessWidget {
  RootPage({super.key});

  static const List<TabbarPage> tabbarPages = <TabbarPage>[
    TabbarPage(0, '首页', Icons.home, HomePage()),
    TabbarPage(1, '工具', Icons.widgets, ToolPage()),
    TabbarPage(2, '项目圈', Icons.school, ProjectPage()),
    TabbarPage(3, '消息', Icons.chat, ImPage()),
  ];
  final RootController rootController = Get.put(RootController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: buildBody()),
      bottomNavigationBar: buildMaterial2Tabbar(),
    );
  }

  Widget buildBody() {
    return Obx(() => IndexedStack(
          index: rootController.currentIndex.value,
          children: tabbarPages.map((e) => e.page).toList(),
        ));
  }

  Widget buildMaterial2Tabbar() {
    return Obx(() => BottomNavigationBar(
          onTap: (int index) {
            rootController.currentIndex.value = index;
          },
          currentIndex: rootController.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          items: tabbarPages.map((TabbarPage destination) {
            return BottomNavigationBarItem(
              icon: Icon(destination.icon),
              label: destination.title,
            );
          }).toList(),
        ));
  }
}
