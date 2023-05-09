import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hse_lyc_code_test_system/feature/contest/model/contest_model.dart';
import 'package:hse_lyc_code_test_system/feature/contest/model/task_model.dart';
import 'package:hse_lyc_code_test_system/feature/contest/view/task_view.dart';
import 'package:hse_lyc_code_test_system/service/ejudge_service.dart';
import 'package:hse_lyc_code_test_system/shared/theme/app_text_styles.dart';

class ContestTasksView extends StatefulWidget {
  final ContestModel contestModel;

  const ContestTasksView({
    Key? key,
    required this.contestModel,
  }) : super(key: key);

  @override
  State<ContestTasksView> createState() => _ContestTasksViewState();
}

class _ContestTasksViewState extends State<ContestTasksView> {
  final _ejudgeService = EjudgeService();
  final _pageController = PageController();
  int _currentPage = 0;

  late final Future<List<TaskModel>> _tasksFuture;

  @override
  void initState() {
    super.initState();
    _tasksFuture = _ejudgeService.parseTasks(widget.contestModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contestModel.title),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _tasksFuture,
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
                      return GestureDetector(
                        onTap: () {
                          _pageController.jumpToPage(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _currentPage == index ? Colors.deepPurpleAccent : Colors.blue,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          margin: EdgeInsets.symmetric(
                            horizontal: 8.w,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 8.h,
                            ),
                            child: Text(
                              tasks[index].title,
                              style: AppTextStyles.head22.copyWith(color: Colors.white),
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
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      return TaskView(
                        contestName: widget.contestModel.title,
                        taskModel: tasks[index],
                      );
                    },
                    itemCount: tasks.length,
                    onPageChanged: (pageNumber) {
                      _currentPage = pageNumber;
                      setState(() {});
                    },
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: Text('Произошла непредвиденная ошибка!'),
          );
        },
      ),
    );
  }
}
