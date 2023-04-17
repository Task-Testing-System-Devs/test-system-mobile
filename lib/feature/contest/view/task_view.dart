import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hse_lyc_code_test_system/feature/contest/model/task_model.dart';
import 'package:hse_lyc_code_test_system/shared/widget/app_elevated_button.dart';

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
          DropdownButton<String>(
              value: "C++",
              items: const <DropdownMenuItem<String>>[
                DropdownMenuItem<String>(
                  value: "C++",
                  child: Text("C++"),
                ),
                DropdownMenuItem<String>(
                  value: "Python",
                  child: Text("Python"),
                ),
                DropdownMenuItem<String>(
                  value: "Java",
                  child: Text("Java"),
                )
              ],
              onChanged: (value) {}),
          const TextField(
            maxLines: 10,
            decoration: InputDecoration(
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
          AppElevatedButton(text: 'Отправить решение', onPressed: () {})
        ],
      ),
    );
  }
}
