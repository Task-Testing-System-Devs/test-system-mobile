import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hse_lyc_code_test_system/feature/contest/model/contest_model.dart';
import 'package:hse_lyc_code_test_system/feature/contest/view/contest_tasks_view.dart';
import 'package:hse_lyc_code_test_system/feature/contest/widget/contest_card.dart';
import 'package:hse_lyc_code_test_system/service/ejudge_service.dart';
import 'package:hse_lyc_code_test_system/service/navigation_service.dart';

class ContestListView extends StatefulWidget {
  const ContestListView({Key? key}) : super(key: key);

  @override
  State<ContestListView> createState() => _ContestListViewState();
}

class _ContestListViewState extends State<ContestListView> {
  final contests = <ContestModel>[
    ContestModel(
      id: 1,
      title: 'Контест 1',
      startTime: "11.02.2023",
      finishTime: "12.02.2023",
      isResolvable: false,
      isMarkRated: true,
      isTaskRated: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Контесты'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        itemBuilder: (context, index) {
          return ContestCard(
            contestModel: contests[index],
            onTap: () async {
              await NavigationService.push(context, const ContestTasksView());
            },
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 4.h,
          );
        },
        itemCount: contests.length,
      ),
    );
  }
}
