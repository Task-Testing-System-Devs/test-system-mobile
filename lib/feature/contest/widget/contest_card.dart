import 'package:flutter/material.dart';
import 'package:hse_lyc_code_test_system/feature/contest/model/contest_model.dart';
import 'package:hse_lyc_code_test_system/shared/theme/app_text_styles.dart';

class ContestCard extends StatelessWidget {
  final ContestModel contestModel;
  final void Function() onTap;

  const ContestCard({
    Key? key,
    required this.contestModel,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                contestModel.title,
                style: AppTextStyles.head24,
              ),
              Text('Начало: ${getDateTimeString(contestModel.startTime)}'),
              Text('Конец: ${getDateTimeString(contestModel.finishTime)}'),
            ],
          ),
        ),
      ),
    );
  }

  String getDateTimeString(DateTime dateTime) {
    String day = dateTime.day.toString();
    if (dateTime.day >= 1 && dateTime.day <= 9) {
      day = '0${dateTime.day}';
    }

    String month = dateTime.month.toString();
    if (dateTime.month >= 1 && dateTime.month <= 9) {
      month = '0${dateTime.month}';
    }

    String hour = dateTime.hour.toString();
    if (dateTime.hour >= 0 && dateTime.hour <= 9) {
      hour = '0${dateTime.hour}';
    }
    String minute = dateTime.minute.toString();
    if (dateTime.minute >= 0 && dateTime.minute <= 9) {
      minute = '0${dateTime.minute}';
    }

    return '$day.$month.${dateTime.year} $hour:$minute';
  }
}
