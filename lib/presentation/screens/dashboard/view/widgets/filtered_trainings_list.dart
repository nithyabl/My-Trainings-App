import 'package:flutter/material.dart';
import 'package:my_trainings_app/core/constants/route_constants.dart';
import 'package:my_trainings_app/core/constants/string_constants.dart';
import 'package:my_trainings_app/data/model/training_model.dart';
import 'package:my_trainings_app/presentation/common_widgets/empty_filter_widget.dart';
import 'package:my_trainings_app/presentation/screens/training_details/view/training_details_screen.dart';

class FilteredTrainingsList extends StatelessWidget {
  final List<Training> filteredTrainings;

  const FilteredTrainingsList({super.key, required this.filteredTrainings});

  @override
  Widget build(BuildContext context) {
    return filteredTrainings.isEmpty
        ? const EmptyFilterWidget()
        : ListView.builder(
            itemCount: filteredTrainings.length,
            itemBuilder: (context, index) {
              final training = filteredTrainings[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    RouteConstants.trainingDetailsPath,
                    arguments: training,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          date(training),
                          const SizedBox(height: 8),
                          location(training),
                        ],
                      ),
                      divider(),
                      const SizedBox(width: 16),
                      details(training),
                    ],
                  ),
                ),
              );
            },
          );
  }

  Expanded details(Training training) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            training.title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.red,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      training.trainerName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          enrollNow(),
        ],
      ),
    );
  }

  Container divider() {
    return Container(
      width: 2,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.black,
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
      ),
    );
  }

  Text location(Training training) {
    return Text(
      training.location,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.brown,
      ),
    );
  }

  Text date(Training training) {
    return Text(
      training.trainingFromDate.toShortString(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 13,
      ),
    );
  }

  Align enrollNow() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          StringConstants.enrollNow,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
