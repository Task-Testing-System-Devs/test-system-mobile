import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hse_lyc_code_test_system/feature/contest/model/contest_model.dart';
import 'package:hse_lyc_code_test_system/feature/contest/presenter/contest_presenter.dart';
import 'package:hse_lyc_code_test_system/feature/contest/view/contest_tasks_view.dart';
import 'package:hse_lyc_code_test_system/feature/contest/widget/contest_card.dart';
import 'package:hse_lyc_code_test_system/service/navigation_service.dart';
import 'package:hse_lyc_code_test_system/service/shared_preferences_service.dart';
import 'package:hse_lyc_code_test_system/shared/theme/app_text_styles.dart';

class ContestListView extends StatefulWidget {
  const ContestListView({Key? key}) : super(key: key);

  @override
  State<ContestListView> createState() => _ContestListViewState();
}

class _ContestListViewState extends State<ContestListView> {
  final _contestPresenter = ContestPresenter();
  final _sharedPreferences = SharedPreferencesService();

  late final Future contestsFuture;

  @override
  void initState() {
    super.initState();
    contestsFuture = _contestPresenter.getContests(_sharedPreferences.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Контесты'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: contestsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final contests = snapshot.data as List<ContestModel>;
            if (contests.isEmpty) {
              return Center(
                child: Text(
                  'Контестов нет!',
                  style: AppTextStyles.body16,
                ),
              );
            }
            return ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              itemBuilder: (context, index) {
                return ContestCard(
                  contestModel: contests[index],
                  onTap: () async {
                    await NavigationService.push(
                      context,
                      ContestTasksView(
                        contestModel: contests[index],
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 4.h,
                );
              },
              itemCount: contests.length,
            );
          }
          return Center(
            child: Text(
              'Ошибка!',
              style: AppTextStyles.body16,
            ),
          );
        },
      ),
    );
  }
}
