import 'package:my_trainings_app/data/data_source/training_data_source.dart';
import 'package:my_trainings_app/data/model/training_model.dart';
import 'package:my_trainings_app/data/data_source/training_data.dart';

class TrainingRepository implements TrainingDataSource {
  @override
  List<Training> getAllTrainings() {
    return TrainingData.trainings;
  }

  @override
  Training? getTrainingById(int id) {
    try {
      return TrainingData.trainings.firstWhere((training) => training.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  List<String> getAllLocations() {
    return TrainingData.trainings
        .map((training) => training.location)
        .toSet()
        .toList();
  }

  @override
  List<String> getAllTrainingNames() {
    return TrainingData.trainings
        .map((training) => training.title)
        .toSet()
        .toList();
  }

  @override
  List<String> getAllTrainerNames() {
    return TrainingData.trainings
        .map((training) => training.trainerName)
        .toSet()
        .toList();
  }

  @override
  List<Training> filterTrainings({
    List<String>? locations,
    List<String>? trainingNames,
    List<String>? trainerNames,
  }) {
    return TrainingData.trainings.where((training) {
      final matchesLocation = locations == null ||
          locations.isEmpty ||
          locations.contains(training.location);
      final matchesTrainingName = trainingNames == null ||
          trainingNames.isEmpty ||
          trainingNames.contains(training.title);
      final matchesTrainerName = trainerNames == null ||
          trainerNames.isEmpty ||
          trainerNames.contains(training.trainerName);
      return matchesLocation && matchesTrainingName && matchesTrainerName;
    }).toList();
  }
}
