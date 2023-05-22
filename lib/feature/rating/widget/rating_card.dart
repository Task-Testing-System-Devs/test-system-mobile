import 'package:flutter/material.dart';
import 'package:hse_lyc_code_test_system/feature/rating/model/rating_model.dart';

class StudentRatingCard extends StatelessWidget {
  final int place;
  final RatingModel ratingModel;

  const StudentRatingCard({
    Key? key,
    required this.place,
    required this.ratingModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '$place. ${ratingModel.lastName} ${ratingModel.firstName} ${ratingModel.middleName}',
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
