import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hse_lyc_code_test_system/feature/contest/model/task_model.dart';
import 'package:hse_lyc_code_test_system/feature/contest/view/task_view.dart';
import 'package:hse_lyc_code_test_system/service/ejudge_service.dart';

class ContestTasksView extends StatefulWidget {
  const ContestTasksView({Key? key}) : super(key: key);

  @override
  State<ContestTasksView> createState() => _ContestTasksViewState();
}

class _ContestTasksViewState extends State<ContestTasksView> {
  final ejudgeService = EjudgeService();
  late final Future<List<TaskModel>> tasksFuture;

  @override
  void initState() {
    super.initState();
    tasksFuture = ejudgeService.parseTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: tasksFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              final tasks = snapshot.data as List<TaskModel>;

              return Column(
                children: <Widget>[
                  SizedBox(
                    height: 24.h,
                  ),
                  SizedBox(
                    height: 40.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 40.h,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                tasks[index].title,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                    child: PageView.builder(
                      itemBuilder: (context, index) {
                        return TaskView(taskModel: tasks[index]);
                      },
                      itemCount: tasks.length,
                    ),
                  ),
                ],
              );
            }
            if (snapshot.hasError) {
              print(snapshot.error.toString());
            }
            return const Center(child: Text('Error'));
          }),
    );
  }
}
