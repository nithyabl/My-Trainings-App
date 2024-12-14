import 'package:my_trainings_app/data/model/training_model.dart';

abstract class TrainingDataSource {
  List<Training> getAllTrainings();
  Training? getTrainingById(int id);

  List<String> getAllLocations();
  List<String> getAllTrainingNames();
  List<String> getAllTrainerNames();

  List<Training> filterTrainings({
    List<String>? locations,
    List<String>? trainingNames,
    List<String>? trainerNames,
  });
}
