import 'package:flutter/material.dart';
import 'package:flutter_getx_demo/pages/base/project.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(1),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        debugPrint(settings.name);
        if (settings.name == '/') {
          return GetPageRoute(page: () => buildDefaultPage());
        } else if (settings.name == ProjectListPage.route) {
          return GetPageRoute(page: () => const ProjectListPage());
        } else if (settings.name == ProjectDetailPage.route) {
          return GetPageRoute(page: () => const ProjectDetailPage());
        } else if (settings.name == ProjectAddPage.route) {
          return GetPageRoute(page: () => const ProjectAddPage());
        } else if (settings.name == '/project/edit/:id') {
          final id = (settings.arguments as Map)['id'] as int;
          return GetPageRoute(page: () => ProjectEditPage(id: id));
        } else {
          return GetPageRoute(page: () => buildDefaultPage());
        }
      },
    );
  }

  Widget buildDefaultPage() {
    return Scaffold(
      appBar: AppBar(title: const Text('首页')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(ProjectListPage.route, id: 1);
              },
              child: const Text('项目列表'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(ProjectDetailPage.route,
                    id: 1, arguments: ProjectDetailArguments(10));
              },
              child: const Text('项目列表详情-10'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(ProjectAddPage.route, id: 1);
              },
              child: const Text('添加项目'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/project/edit/10', id: 1);
              },
              child: const Text('编辑项目'),
            ),
          ],
        ),
      ),
    );
  }
}
