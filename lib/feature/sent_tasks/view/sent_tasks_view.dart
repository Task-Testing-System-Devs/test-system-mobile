import 'package:flutter/material.dart';

class SentTasksView extends StatefulWidget {
  const SentTasksView({Key? key}) : super(key: key);

  @override
  State<SentTasksView> createState() => _SentTasksViewState();
}

class _SentTasksViewState extends State<SentTasksView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Страница посылок!'),
      ),
    );
  }
}
