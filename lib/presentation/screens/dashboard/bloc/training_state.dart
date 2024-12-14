import 'package:equatable/equatable.dart';
import 'package:my_trainings_app/core/enums/filter_type_enum.dart';
import 'package:my_trainings_app/data/model/training_model.dart';

class TrainingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TrainingInitial extends TrainingState {}

class TrainingLoading extends TrainingState {}

class TrainingLoaded extends TrainingState {
  final List<Training> allTrainings;
  final List<Training> filteredTrainings;
  final List<String> filterItems;
  final FilterType? selectedFilter;
  final List<String> selectedLocations;
  final List<String> selectedTrainingNames;
  final List<String> selectedTrainerNames;

  TrainingLoaded({
    required this.allTrainings,
    required this.filteredTrainings,
    required this.filterItems,
    required this.selectedFilter,
    required this.selectedLocations,
    required this.selectedTrainingNames,
    required this.selectedTrainerNames,
  });

  TrainingLoaded copyWith({
    List<Training>? allTrainings,
    List<Training>? filteredTrainings,
    List<String>? filterItems,
    FilterType? selectedFilter,
    List<String>? selectedLocations,
    List<String>? selectedTrainingNames,
    List<String>? selectedTrainerNames,
  }) {
    return TrainingLoaded(
      allTrainings: allTrainings ?? this.allTrainings,
      filteredTrainings: filteredTrainings ?? this.filteredTrainings,
      filterItems: filterItems ?? this.filterItems,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      selectedLocations: selectedLocations ?? this.selectedLocations,
      selectedTrainingNames:
          selectedTrainingNames ?? this.selectedTrainingNames,
      selectedTrainerNames: selectedTrainerNames ?? this.selectedTrainerNames,
    );
  }

  @override
  List<Object?> get props => [
        allTrainings,
        filteredTrainings,
        filterItems,
        selectedFilter,
        selectedLocations,
        selectedTrainingNames,
        selectedTrainerNames,
      ];
}

class TrainingError extends TrainingState {
  final String errorMessage;

  TrainingError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class TrainingDetailsLoaded extends TrainingState {
  final Training training;

  TrainingDetailsLoaded(this.training);

  @override
  List<Object?> get props => [training];
}
