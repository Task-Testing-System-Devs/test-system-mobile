import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hse_lyc_code_test_system/feature/code_test_system.dart';
import 'package:hse_lyc_code_test_system/feature/contest/view/contest_list_view.dart';
import 'package:hse_lyc_code_test_system/feature/main/widget/section_button.dart';
import 'package:hse_lyc_code_test_system/feature/profile/view/profile_view.dart';
import 'package:hse_lyc_code_test_system/feature/rating/view/rating_view.dart';
import 'package:hse_lyc_code_test_system/feature/sent_tasks/view/sent_tasks_view.dart';
import 'package:hse_lyc_code_test_system/main.dart';
import 'package:hse_lyc_code_test_system/service/navigation_service.dart';
import 'package:hse_lyc_code_test_system/shared/theme/app_text_styles.dart';

class MainView extends StatefulWidget {
  final void Function(int) onButtonTap;

  const MainView({
    Key? key,
    required this.onButtonTap,
  }) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final key = GlobalKey<CodeTestSystemState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Добро пожаловать! Самое время решить задачи :)',
                style: AppTextStyles.head24,
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: <Widget>[
                  SectionButton(
                    text: 'Контесты',
                    icon: const Icon(
                      Icons.add_card,
                      color: Colors.white,
                    ),
                    onTap: () {
                      widget.onButtonTap(1);
                    },
                  ),
                  SizedBox(
                    width: 23.w,
                  ),
                  SectionButton(
                    text: 'Рейтинг',
                    icon: const Icon(
                      Icons.data_thresholding_outlined,
                      color: Colors.white,
                    ),
                    onTap: () {
                      widget.onButtonTap(2);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: <Widget>[
                  SectionButton(
                    text: 'Посылки',
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    onTap: () {
                      widget.onButtonTap(3);
                    },
                  ),
                  SizedBox(
                    width: 23.w,
                  ),
                  SectionButton(
                    text: 'Профиль',
                    icon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    onTap: () {
                      widget.onButtonTap(4);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
