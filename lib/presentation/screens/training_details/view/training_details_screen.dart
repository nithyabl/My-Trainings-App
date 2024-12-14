import 'package:flutter/material.dart';
import 'package:my_trainings_app/core/constants/string_constants.dart';
import 'package:my_trainings_app/data/model/training_model.dart';

class TrainingDetailsScreen extends StatelessWidget {
  final Training training;

  const TrainingDetailsScreen({
    super.key,
    required this.training,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          training.title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title(),
                  const SizedBox(height: 10),
                  trainer(),
                  location(),
                  const SizedBox(height: 20),
                  summaryTitle(),
                  const SizedBox(height: 5),
                  summary(),
                  const SizedBox(height: 20),
                  cost(),
                  const SizedBox(height: 10),
                  date(),
                  const SizedBox(height: 10),
                  prerequisites(),
                  const SizedBox(height: 10),
                  contactInfo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Text contactInfo() {
    return Text(
      '${StringConstants.contact} ${training.contactInfo}',
      style: const TextStyle(
        fontSize: 16,
        color: Colors.blue,
      ),
    );
  }

  Text prerequisites() {
    return Text(
      '${StringConstants.prerequisites} ${training.prerequisites}',
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
    );
  }

  Text date() {
    return Text(
      '${StringConstants.duration} ${training.trainingFromDate.toShortString()} - ${training.trainingToDate.toShortString()}',
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
    );
  }

  Text cost() {
    return Text(
      '${StringConstants.cost} \$${training.cost.toStringAsFixed(2)}',
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black87,
      ),
    );
  }

  Text summary() {
    return Text(
      training.summary,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
    );
  }

  Text summaryTitle() {
    return const Text(
      StringConstants.summary,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text location() {
    return Text(
      '${StringConstants.location} ${training.location}',
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black87,
      ),
    );
  }

  Text trainer() {
    return Text(
      '${StringConstants.trainer} ${training.trainerName}',
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black87,
      ),
    );
  }

  Text title() {
    return Text(
      training.title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

extension DateTimeExtensions on DateTime {
  String toShortString() {
    return '$day/$month/$year';
  }
}
