import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hse_lyc_code_test_system/feature/profile/widget/rating_card.dart';
import 'package:hse_lyc_code_test_system/shared/theme/app_text_styles.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
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
                        'Фамилия Имя Отчество',
                        style: AppTextStyles.head22,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'E-mail: absmirnov@edu.hse.ru',
                          style: AppTextStyles.body16,
                        ),
                        Text(
                          'Группа: 10И3',
                          style: AppTextStyles.body16,
                        ),
                        Text(
                          'Направление: Информатика, инженерия и математика',
                          style: AppTextStyles.body16,
                        ),
                        Text(
                          'Всего решено задач: 73',
                          style: AppTextStyles.body16,
                        ),
                        Text(
                          'Рейтинг по задачам: 5200',
                          style: AppTextStyles.body16,
                        ),
                        Text(
                          'Рейтинг по оценкам: 4800',
                          style: AppTextStyles.body16,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 220.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                SizedBox(
                  width: 16.w,
                ),
                const RatingCard(text: 'Место в рейтинге по направлению'),
                SizedBox(
                  width: 16.w,
                ),
                const RatingCard(text: 'Место в рейтинге по группе'),
                SizedBox(
                  width: 16.w,
                ),
                const RatingCard(text: 'Место в общем рейтинге'),
                SizedBox(
                  width: 16.w,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
