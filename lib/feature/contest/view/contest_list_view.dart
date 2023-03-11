import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hse_lyc_code_test_system/feature/contest/model/contest_model.dart';
import 'package:hse_lyc_code_test_system/feature/contest/widget/contest_card.dart';

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
    ContestModel(
      id: 2,
      title: 'Контест 2',
      startTime: "11.02.2023",
      finishTime: "12.02.2023",
      isResolvable: false,
      isMarkRated: true,
      isTaskRated: false,
    ),
    ContestModel(
      id: 3,
      title: 'Контест 3',
      startTime: "11.02.2023",
      finishTime: "12.02.2023",
      isResolvable: false,
      isMarkRated: false,
      isTaskRated: true,
    ),
    ContestModel(
      id: 4,
      title: 'Контест 4',
      startTime: "11.02.2023",
      finishTime: "12.02.2023",
      isResolvable: false,
      isMarkRated: true,
      isTaskRated: true,
    ),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        itemBuilder: (context, index) {
          return ContestCard(
            contestModel: contests[index],
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
