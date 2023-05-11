import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hse_lyc_code_test_system/feature/sent_tasks/model/sent_task_model.dart';
import 'package:hse_lyc_code_test_system/shared/theme/app_text_styles.dart';
import 'package:hse_lyc_code_test_system/shared/widget/app_elevated_button.dart';

class SentTaskCard extends StatefulWidget {
  final SentTaskModel sentTaskModel;

  const SentTaskCard({Key? key, required this.sentTaskModel}) : super(key: key);

  @override
  State<SentTaskCard> createState() => _SentTaskCardState();
}

class _SentTaskCardState extends State<SentTaskCard> {
  bool isCodeShown = false;
  var currentIcon = const Icon(Icons.keyboard_arrow_down);

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
                'ID: ${widget.sentTaskModel.id}',
                style: AppTextStyles.body16,
              ),
              Text(
                'Время исполнения: ${widget.sentTaskModel.usedTime} с',
                style: AppTextStyles.body16,
              ),
              Text(
                'Использованная память: ${widget.sentTaskModel.usedMemory} МБ',
                style: AppTextStyles.body16,
              ),
              Text(
                'Язык программы: ${widget.sentTaskModel.language}',
                style: AppTextStyles.body16,
              ),
              Text(
                'Результат: ${widget.sentTaskModel.status}',
                style: AppTextStyles.body16,
              ),
              Text(
                'Ошибка на тесте: ${widget.sentTaskModel.errorTest}',
                style: AppTextStyles.body16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Исходный код',
                    style: AppTextStyles.body18,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isCodeShown = !isCodeShown;
                        if (isCodeShown) {
                          currentIcon = const Icon(Icons.keyboard_arrow_up);
                        } else {
                          currentIcon = const Icon(Icons.keyboard_arrow_down);
                        }
                      });
                    },
                    icon: currentIcon,
                  ),
                ],
              ),
              Visibility(
                visible: isCodeShown,
                child: Column(
                  children: <Widget>[
                    OutlinedButton(
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(text: '${widget.sentTaskModel.code}'),
                        );
                      },
                      child: const Text('Копировать код'),
                    ),
                    Text('${widget.sentTaskModel.code}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
