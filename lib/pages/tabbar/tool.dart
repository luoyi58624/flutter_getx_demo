import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToolPage extends StatefulWidget {
  const ToolPage({super.key});

  @override
  State<ToolPage> createState() => _ToolPagePageState();
}

class _ToolPagePageState extends State<ToolPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('工具')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/task/list');
              },
              child: const Text('跳转嵌套子页面'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: Text('count: $count'),
            ),
          ],
        ),
      ),
    );
  }
}
