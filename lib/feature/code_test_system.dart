import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hse_lyc_code_test_system/feature/auth/view/auth_view.dart';
import 'package:hse_lyc_code_test_system/feature/contest/view/contest_list_view.dart';
import 'package:hse_lyc_code_test_system/feature/main/view/main_view.dart';
import 'package:hse_lyc_code_test_system/feature/profile/view/profile_view.dart';
import 'package:hse_lyc_code_test_system/feature/rating/view/rating_view.dart';
import 'package:hse_lyc_code_test_system/feature/sent_tasks/view/sent_tasks_view.dart';
import 'package:hse_lyc_code_test_system/service/shared_preferences_service.dart';
import 'package:hse_lyc_code_test_system/shared/theme/app_themes.dart';

class CodeTestSystem extends StatefulWidget {
  const CodeTestSystem({Key? key}) : super(key: key);

  @override
  State<CodeTestSystem> createState() => _CodeTestSystemState();
}

class _CodeTestSystemState extends State<CodeTestSystem> {
  int currentIndex = 0;

  final pages = const <Widget>[
    MainView(),
    ContestListView(),
    RatingView(),
    SentTasksView(),
    ProfileView(),
  ];

  final sharedPreferencesService = SharedPreferencesService();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          home: sharedPreferencesService.token == ''
              ? AuthView(
                  onSuccessfulAuth: () => setState(() {}),
                )
              : Scaffold(
                  body: pages[currentIndex],
                  bottomNavigationBar: BottomNavigationBar(
                    unselectedItemColor: Colors.blue,
                    selectedItemColor: Colors.black,
                    currentIndex: currentIndex,
                    onTap: (newIndex) async {
                      setState(() {
                        currentIndex = newIndex;
                      });
                    },
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
                      BottomNavigationBarItem(icon: Icon(Icons.add_card), label: 'Контесты'),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.data_thresholding_outlined),
                        label: 'Рейтинг',
                      ),
                      BottomNavigationBarItem(icon: Icon(Icons.send), label: 'Посылки'),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Профиль',
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
