import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({super.key});
  static const String route = '/project/list';

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
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
      appBar: AppBar(title: const Text('项目列表')),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: OutlinedButton(
              onPressed: () {
                Get.toNamed(ProjectDetailPage.route,
                    id: 1, arguments: ProjectDetailArguments(index + 1));
              },
              child: Text('项目详情 -  [${index + 1}]'),
            ),
          );
        },
      ),
    );
  }
}

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({super.key});
  static const String route = '/project/detail';

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    var args = Get.arguments as ProjectDetailArguments;
    return Scaffold(
      appBar: AppBar(title: Text('项目详情${args.id}')),
      body: Center(
        child: TextButton(
          child: Text('count: $count'),
          onPressed: () {
            setState(() {
              count++;
            });
          },
        ),
      ),
    );
  }
}

class ProjectAddPage extends StatelessWidget {
  const ProjectAddPage({super.key});
  static const String route = '/project/add';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('添加项目')),
      body: Center(
        child: TextButton(
          child: const Text('返回'),
          onPressed: () {
            Get.back(id: 1);
          },
        ),
      ),
    );
  }
}

class ProjectEditPage extends StatefulWidget {
  const ProjectEditPage({super.key, required this.id});
  static const String route = '/project/edit';
  final int id;

  @override
  State<ProjectEditPage> createState() => _ProjectEditPageState();
}

class _ProjectEditPageState extends State<ProjectEditPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // var id = Get.parameters['id'] as int;
    return Scaffold(
      appBar: AppBar(title: Text('编辑项目-${widget.id}')),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: const Text('返回'),
              onPressed: () {
                Get.back(id: 1);
              },
            ),
            TextButton(
              child: Text('count: $count'),
              onPressed: () {
                setState(() {
                  count++;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class ProjectDetailArguments {
  final int id;

  ProjectDetailArguments(this.id);
}
