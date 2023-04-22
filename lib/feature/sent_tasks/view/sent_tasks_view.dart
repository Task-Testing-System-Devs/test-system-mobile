import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hse_lyc_code_test_system/feature/sent_tasks/model/sent_task_model.dart';
import 'package:hse_lyc_code_test_system/feature/sent_tasks/widget/sent_task_card.dart';

class SentTasksView extends StatefulWidget {
  const SentTasksView({Key? key}) : super(key: key);

  @override
  State<SentTasksView> createState() => _SentTasksViewState();
}

class _SentTasksViewState extends State<SentTasksView> {
  final sentTasks = <SentTaskModel>[
    // SentTaskModel(taskName: 'Задача 1', id: '3432423', time: 0.5, memory: 64.0),
    // SentTaskModel(taskName: 'Задача 1', id: '3432423', time: 0.5, memory: 64.0),
    // SentTaskModel(taskName: 'Задача 1', id: '3432423', time: 0.5, memory: 64.0),
    // SentTaskModel(taskName: 'Задача 1', id: '3432423', time: 0.5, memory: 64.0),
    // SentTaskModel(taskName: 'Задача 1', id: '3432423', time: 0.5, memory: 64.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Посылки'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        itemBuilder: (context, index) {
          return SentTaskCard(sentTaskModel: sentTasks[index]);
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 4.h,
          );
        },
        itemCount: sentTasks.length,
      ),
    );
  }
}
