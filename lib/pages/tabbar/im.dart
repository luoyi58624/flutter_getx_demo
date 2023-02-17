import 'package:flutter/material.dart';

class ImPage extends StatefulWidget {
  const ImPage({super.key});

  @override
  State<ImPage> createState() => _ImPagePageState();
}

class _ImPagePageState extends State<ImPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('消息')),
      body: const Center(child: Text('聊天页面')),
    );
  }
}
