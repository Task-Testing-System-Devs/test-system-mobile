import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hse_lyc_code_test_system/feature/sent_tasks/model/sent_task_model.dart';
import 'package:hse_lyc_code_test_system/feature/sent_tasks/presenter/sent_tasks_presenter.dart';
import 'package:hse_lyc_code_test_system/feature/sent_tasks/widget/sent_task_card.dart';
import 'package:hse_lyc_code_test_system/service/shared_preferences_service.dart';

class SentTasksView extends StatefulWidget {
  const SentTasksView({Key? key}) : super(key: key);

  @override
  State<SentTasksView> createState() => _SentTasksViewState();
}

class _SentTasksViewState extends State<SentTasksView> {
  final _sentTasksPresenter = SentTasksPresenter();
  final _sharedPreferencesService = SharedPreferencesService();
  late final Future sentTasksFuture;

  @override
  void initState() {
    super.initState();
    sentTasksFuture = _sentTasksPresenter.getAllSentTasks(_sharedPreferencesService.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Посылки'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: sentTasksFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final sentTasks = snapshot.data as List<SentTaskModel>;
            return ListView.separated(
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
            );
          } else if (!snapshot.hasData && !snapshot.hasError) {
            return const Center(
              child: Text(
                'У вас нет ни одной посылки!',
                style: TextStyle(fontSize: 18.0),
              ),
            );
          }
          return const Center(
            child: Text('Error'),
          );
        },
      ),
    );
  }
}
