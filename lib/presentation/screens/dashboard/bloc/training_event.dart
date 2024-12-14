import 'package:equatable/equatable.dart';
import 'package:my_trainings_app/core/enums/filter_type_enum.dart';

abstract class TrainingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchAllTrainings extends TrainingEvent {}

class FetchTrainingById extends TrainingEvent {
  final int id;

  FetchTrainingById(this.id);

  @override
  List<Object?> get props => [id];
}

class FilterTrainings extends TrainingEvent {
  final List<String>? locations;
  final List<String>? trainingNames;
  final List<String>? trainerNames;
  final String selectedFilter;

  FilterTrainings({
    required this.selectedFilter,
    this.locations,
    this.trainingNames,
    this.trainerNames,
  });

  @override
  List<Object?> get props => [locations, trainingNames, trainerNames];
}

class FetchFilterItems extends TrainingEvent {
  final FilterType filterType;

  FetchFilterItems(this.filterType);

  @override
  List<Object?> get props => [filterType];
}

class UpdateSelectedFilters extends TrainingEvent {
  final FilterType filterType;
  final List<String> selectedItems;

  UpdateSelectedFilters({
    required this.filterType,
    required this.selectedItems,
  });

  @override
  List<Object?> get props => [filterType, selectedItems];
}
