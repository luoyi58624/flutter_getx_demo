import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List dataList = [];
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; i++) {
      dataList.add({'name': 'porject-item$i'});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('任务列表')),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: OutlinedButton(
              onPressed: () {
                Get.toNamed('/task/detail',
                    arguments: ProjectDetailArguments(index + 1));
              },
              child: Text('任务详情 - [${index + 1}]'),
            ),
          );
        },
      ),
    );
  }
}

class TaskDetailPage extends StatefulWidget {
  const TaskDetailPage({super.key});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    var args = Get.arguments as ProjectDetailArguments;
    return Scaffold(
        appBar: AppBar(title: Text('任务详情${args.id}')),
        body: Center(
          child: TextButton(
            child: Text('count: $count'),
            onPressed: () {
              setState(() {
                count++;
              });
            },
          ),
        ));
  }
}

class ProjectDetailArguments {
  final int id;

  ProjectDetailArguments(this.id);
}
