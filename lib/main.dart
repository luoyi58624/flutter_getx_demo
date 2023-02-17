import 'package:flutter/material.dart';
import 'package:flutter_getx_demo/pages/base/task.dart';
import 'package:flutter_getx_demo/pages/root_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => RootPage()),
        GetPage(name: '/task/list', page: () => const TaskListPage()),
        GetPage(name: '/task/detail', page: () => const TaskDetailPage()),
      ],
    ),
  );
}

class HomeController extends GetxController {
  var count = 0.obs;
  var count2 = 0.obs;
  increment() => count++;
  increment2(value) => count2.value = value;
}

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                controller.increment();
              },
              child: Obx(() => Text('count: ${controller.count}')),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                controller.increment2(1000);
              },
              child: Obx(() => Text('count2: ${controller.count2}')),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Get.to(FirstPage());
              },
              child: const Text('一级页面'),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstController extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class FirstPage extends GetView<FirstController> {
  FirstPage({super.key});

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ChildPage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                homeController.increment();
              },
              child: Obx(() => Text('home count: ${homeController.count}')),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                controller.increment();
              },
              child: Obx(() => Text('first count: ${controller.count}')),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Get.to(SecondPage());
              },
              child: const Text('二级页面'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('返回'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondController extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  final HomeController homeController = Get.find();
  final FirstController firstController = Get.find();

  @override
  Widget build(BuildContext context) {
    final SecondController secondController = Get.put(SecondController());
    return Scaffold(
      appBar: AppBar(title: const Text('ChildPage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                homeController.increment();
              },
              child: Obx(() => Text('home count: ${homeController.count}')),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                firstController.increment();
              },
              child: Obx(() => Text('first count: ${firstController.count}')),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                secondController.increment();
              },
              child: Obx(() => Text('second count: ${secondController.count}')),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Get.to(ThreePage());
              },
              child: const Text('跳转三级页面'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('返回'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Get.offAll(const HomePage());
              },
              child: const Text('返回首页'),
            ),
          ],
        ),
      ),
    );
  }
}

class ThreeController extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class ThreePage extends StatelessWidget {
  ThreePage({super.key});

  final HomeController homeController = Get.find();
  final FirstController firstController = Get.find();
  final SecondController secondController = Get.find();

  @override
  Widget build(BuildContext context) {
    final ThreeController threeController = Get.put(ThreeController());
    return Scaffold(
      appBar: AppBar(title: const Text('ChildPage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                homeController.increment();
              },
              child: Obx(() => Text('home count: ${homeController.count}')),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                firstController.increment();
              },
              child: Obx(() => Text('first count: ${firstController.count}')),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                secondController.increment();
              },
              child: Obx(() => Text('second count: ${secondController.count}')),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                threeController.increment();
              },
              child: Obx(() => Text('three count: ${threeController.count}')),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('返回'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Get.offAll(const HomePage());
              },
              child: const Text('返回首页'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Get.offAll(FirstPage());
              },
              child: const Text('返回一级页面'),
            ),
          ],
        ),
      ),
    );
  }
}
