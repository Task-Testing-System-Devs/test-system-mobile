import 'package:flutter/material.dart';

class ContestListView extends StatefulWidget {
  const ContestListView({Key? key}) : super(key: key);

  @override
  State<ContestListView> createState() => _ContestListViewState();
}

class _ContestListViewState extends State<ContestListView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Страница контестов!',
        ),
      ),
    );
  }
}
