import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hse_lyc_code_test_system/feature/auth/view/auth_view.dart';
import 'package:hse_lyc_code_test_system/feature/code_test_system.dart';
import 'package:hse_lyc_code_test_system/feature/profile/model/profile_model.dart';
import 'package:hse_lyc_code_test_system/feature/profile/presenter/profile_presenter.dart';
import 'package:hse_lyc_code_test_system/feature/profile/widget/profile_rating_card.dart';
import 'package:hse_lyc_code_test_system/service/navigation_service.dart';
import 'package:hse_lyc_code_test_system/service/shared_preferences_service.dart';
import 'package:hse_lyc_code_test_system/shared/theme/app_text_styles.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final profilePresenter = ProfilePresenter();
  final sharedPreferencesService = SharedPreferencesService();

  late final Future<dynamic> profileInfo;

  @override
  void initState() {
    super.initState();
    profileInfo = profilePresenter.getProfileInfo(sharedPreferencesService.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              sharedPreferencesService.token = '';
              await NavigationService.pushAndRemoveAll(
                context,
                const CodeTestSystem(),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: FutureBuilder(
        future: profileInfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data is int || !snapshot.hasData) {
              return const Center(
                child: Text('Ошибка при получении данных'),
              );
            }
            final profileData = snapshot.data as ProfileModel;
            return ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: CircleAvatar(
                              radius: 48.r,
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(
                              '${profileData.lastName} ${profileData.firstName} ${profileData.middleName}',
                              style: AppTextStyles.head22,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'E-mail: ${profileData.email}',
                                  style: AppTextStyles.body16,
                                ),
                                if (profileData.group != null)
                                  Text(
                                    'Группа: ${profileData.group}',
                                    style: AppTextStyles.body16,
                                  ),
                                if (profileData.department != null)
                                  Text(
                                    'Направление: ${profileData.department}',
                                    style: AppTextStyles.body16,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Text('Not loaded');
          }
        },
      ),
    );
  }
}
