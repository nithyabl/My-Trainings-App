import 'package:flutter/material.dart';
import 'package:my_trainings_app/core/constants/string_constants.dart';

class EmptyFilterWidget extends StatelessWidget {
  const EmptyFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.search_off,
                size: 40,
                color: Colors.grey,
              ),
              const SizedBox(height: 10),
              Text(
                StringConstants.noTrainingsMatched,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
