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

final navigatorKey = GlobalKey<NavigatorState>();

class CodeTestSystem extends StatefulWidget {
  const CodeTestSystem({Key? key}) : super(key: key);

  @override
  State<CodeTestSystem> createState() => CodeTestSystemState();
}

class CodeTestSystemState extends State<CodeTestSystem> {
  final sharedPreferencesService = SharedPreferencesService();

  @override
  void dispose() {
    super.dispose();
  }

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
              : MainTestSystem(),
        );
      },
    );
  }
}

class MainTestSystem extends StatefulWidget {
  const MainTestSystem({Key? key}) : super(key: key);

  @override
  State<MainTestSystem> createState() => _MainTestSystemState();
}

class _MainTestSystemState extends State<MainTestSystem> {
  int currentPageIndex = 0;
  late Widget currentPage = MainView(
    onButtonTap: onTap,
  );

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = <Widget>[
      MainView(
        onButtonTap: onTap,
      ),
      const ContestListView(),
      const RatingView(),
      const SentTasksView(),
      const ProfileView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.blue,
        selectedItemColor: Colors.black,
        currentIndex: currentPageIndex,
        onTap: onTap,
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
    );
  }

  void onTap(int newIndex) {
    print('tapping');
    setState(() {
      currentPageIndex = newIndex;
      currentPage = pages[newIndex];
    });
  }
}
