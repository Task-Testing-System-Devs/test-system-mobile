import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hse_lyc_code_test_system/feature/contest/model/contest_model.dart';

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
              Text(contestModel.title),
              Text('Начало: ${contestModel.startTime}'),
              Text('Конец: ${contestModel.finishTime}'),
            ],
          ),
        ),
      ),
    );
  }
}
