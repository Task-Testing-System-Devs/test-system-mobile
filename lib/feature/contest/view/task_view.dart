import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hse_lyc_code_test_system/feature/contest/model/task_model.dart';
import 'package:hse_lyc_code_test_system/feature/sent_tasks/model/sent_task_model.dart';
import 'package:hse_lyc_code_test_system/service/ejudge_service.dart';
import 'package:hse_lyc_code_test_system/shared/programming_language.dart';
import 'package:hse_lyc_code_test_system/shared/widget/app_elevated_button.dart';
import 'package:path_provider/path_provider.dart';

class TaskView extends StatefulWidget {
  final TaskModel taskModel;

  const TaskView({
    Key? key,
    required this.taskModel,
  }) : super(key: key);

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final ejudgeService = EjudgeService();
  final codeController = TextEditingController();

  final sentTasksInfo = <SentTaskModel>[];
  ProgrammingLanguage chosenLanguage = ProgrammingLanguage.cpp;

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
          const Text('На вход принимаются числа', style: TextStyle(fontSize: 16.0)),
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
          const Text('Выводится рейтинг', style: TextStyle(fontSize: 16.0)),
          SizedBox(
            height: 16.h,
          ),
          const Text('Решение', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700)),
          SizedBox(
            height: 16.h,
          ),
          DropdownButton<ProgrammingLanguage>(
            value: chosenLanguage,
            items: const <DropdownMenuItem<ProgrammingLanguage>>[
              DropdownMenuItem<ProgrammingLanguage>(
                value: ProgrammingLanguage.cpp,
                child: Text('C++'),
              ),
              DropdownMenuItem<ProgrammingLanguage>(
                value: ProgrammingLanguage.python,
                child: Text('Python'),
              ),
              DropdownMenuItem<ProgrammingLanguage>(
                value: ProgrammingLanguage.java,
                child: Text('Java'),
              )
            ],
            onChanged: (value) {
              setState(() {
                chosenLanguage = value!;
              });
            },
          ),
          Visibility(
            visible: sentTasksInfo.isNotEmpty,
            child: Column(
              children: sentTasksInfo.map(
                (e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(e.id),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(e.status),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(e.errorOnTest),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          TextField(
            controller: codeController,
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

              File file = File('${directory.path}/solution${chosenLanguage.fileExtension}');
              file.writeAsString(codeController.text);

              final base64 = base64Encode(await file.readAsBytes());

              await ejudgeService.sendTask(
                base64,
                widget.taskModel.id,
              );

              final result = await ejudgeService.getResult();
              sentTasksInfo.add(
                SentTaskModel(
                  id: '${widget.taskModel.id}',
                  status: result['status'],
                  errorOnTest: result['error'],
                ),
              );
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
