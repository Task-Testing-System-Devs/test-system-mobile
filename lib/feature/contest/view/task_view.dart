import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hse_lyc_code_test_system/feature/contest/model/task_model.dart';
import 'package:hse_lyc_code_test_system/feature/contest/presenter/contest_presenter.dart';
import 'package:hse_lyc_code_test_system/feature/sent_tasks/model/sent_task_model.dart';
import 'package:hse_lyc_code_test_system/service/ejudge_service.dart';
import 'package:hse_lyc_code_test_system/shared/programming_language.dart';
import 'package:hse_lyc_code_test_system/shared/theme/app_text_styles.dart';
import 'package:hse_lyc_code_test_system/shared/widget/app_elevated_button.dart';
import 'package:path_provider/path_provider.dart';

class TaskView extends StatefulWidget {
  final String contestName;
  final TaskModel taskModel;

  const TaskView({
    Key? key,
    required this.contestName,
    required this.taskModel,
  }) : super(key: key);

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final _ejudgeService = EjudgeService();
  final _contestPresenter = ContestPresenter();
  final _codeController = TextEditingController();

  final _sentTasksInfo = <SentTaskModel>[];
  ProgrammingLanguage _chosenLanguage = ProgrammingLanguage.cpp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          Text(
            widget.taskModel.title,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'Ограничение по времени: ${widget.taskModel.timeLimit}',
            style: const TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            'Ограничение по памяти: ${widget.taskModel.memoryLimit}',
            style: const TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            widget.taskModel.description,
            style: const TextStyle(fontSize: 16.0),
          ),
          SizedBox(
            height: 16.h,
          ),
          const Text(
            'Входные данные',
            style: TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.taskModel.inputExamples
                .map((e) => Text(e, style: AppTextStyles.body16))
                .toList(),
          ),
          SizedBox(
            height: 16.h,
          ),
          const Text(
            'Выходные данные',
            style: TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.taskModel.outputExamples
                .map((e) => Text(e, style: AppTextStyles.body16))
                .toList(),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'Решение',
            style: AppTextStyles.body18.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          DropdownButton<ProgrammingLanguage>(
            value: _chosenLanguage,
            items: const <DropdownMenuItem<ProgrammingLanguage>>[
              DropdownMenuItem<ProgrammingLanguage>(
                value: ProgrammingLanguage.cpp,
                child: Text('C++'),
              ),
              DropdownMenuItem<ProgrammingLanguage>(
                value: ProgrammingLanguage.python,
                child: Text('Python'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                _chosenLanguage = value!;
              });
            },
          ),
          Visibility(
            visible: _sentTasksInfo.isNotEmpty,
            child: Column(
              children: _sentTasksInfo.map(
                (e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(e.taskName ?? ''),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(e.status),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(e.errorTest),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          TextField(
            controller: _codeController,
            maxLines: 10,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          AppElevatedButton(
            text: 'Отправить решение',
            onPressed: () async {
              final directory = await getApplicationDocumentsDirectory();

              File file = File('${directory.path}/solution${_chosenLanguage.fileExtension}');
              await file.writeAsString(_codeController.text);

              final base64 = base64Encode(await file.readAsBytes());

              await _ejudgeService.sendTask(
                base64,
                widget.taskModel.id,
                _chosenLanguage,
              );

              final result = await _ejudgeService.getResult();
              final sentTask = SentTaskModel(
                id: '${widget.taskModel.id}',
                code: _codeController.text,
                language: _chosenLanguage.fileExtension,
                status: result['status'],
                errorTest: result['error'],
                contestName: widget.contestName,
                taskName: widget.taskModel.title,
              );

              _sentTasksInfo.add(sentTask);
              await _contestPresenter.addSentTask(sentTask);
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
