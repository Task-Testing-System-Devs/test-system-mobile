import 'package:flutter/material.dart';
import 'package:hse_lyc_code_test_system/feature/contest/view/contest_list_view.dart';
import 'package:hse_lyc_code_test_system/feature/profile/view/profile_view.dart';
import 'package:hse_lyc_code_test_system/feature/rating/view/rating_view.dart';
import 'package:hse_lyc_code_test_system/feature/sent_tasks/view/sent_tasks_view.dart';
import 'package:hse_lyc_code_test_system/service/navigation_service.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Главная страница'),
      ),
    );
  }
}
