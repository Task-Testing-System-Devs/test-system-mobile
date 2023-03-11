import 'package:flutter/material.dart';
import 'package:hse_lyc_code_test_system/feature/sent_tasks/model/sent_task_model.dart';
import 'package:hse_lyc_code_test_system/shared/theme/app_text_styles.dart';

class SentTaskCard extends StatelessWidget {
  final SentTaskModel sentTaskModel;

  const SentTaskCard({Key? key, required this.sentTaskModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                sentTaskModel.taskName,
                style: AppTextStyles.body16,
              ),
              Text(
                'ID: ${sentTaskModel.id}',
                style: AppTextStyles.body16,
              ),
              Text(
                'Время исполнения: ${sentTaskModel.time} с',
                style: AppTextStyles.body16,
              ),
              Text(
                'Использованная память: ${sentTaskModel.memory} МБ',
                style: AppTextStyles.body16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
