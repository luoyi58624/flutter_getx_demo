import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('项目圈')),
      body: Container(
        child: Column(
            mainAxisSize: MainAxisSize.min, children: [const Text('hello')]),
        decoration: BoxDecoration(color: Colors.red),
      ),
    );
  }
}
