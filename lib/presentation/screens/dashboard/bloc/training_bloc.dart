import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_trainings_app/domain/repo/training_repo.dart';
import 'training_event.dart';
import 'training_state.dart';
import 'package:my_trainings_app/core/enums/filter_type_enum.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  final TrainingRepository trainingRepository;

  TrainingBloc(this.trainingRepository) : super(TrainingInitial()) {
    on<FetchAllTrainings>(_onFetchAllTrainings);
    on<FetchTrainingById>(_onFetchTrainingById);
    on<FilterTrainings>(_onFilterTrainings);
    on<FetchFilterItems>(_onFetchFilterItems);
    on<UpdateSelectedFilters>(_onUpdateSelectedFilters);
  }

  Future<void> _onFetchAllTrainings(
      FetchAllTrainings event, Emitter<TrainingState> emit) async {
    emit(TrainingLoading());
    try {
      final trainings = trainingRepository.getAllTrainings();
      emit(TrainingLoaded(
        allTrainings: trainings,
        filteredTrainings: trainings,
        filterItems: trainingRepository.getAllLocations(),
        selectedFilter: FilterType.location,
        selectedLocations: const [],
        selectedTrainingNames: const [],
        selectedTrainerNames: const [],
      ));
    } catch (e) {
      emit(TrainingError('Failed to load trainings.'));
    }
  }

  Future<void> _onFetchTrainingById(
      FetchTrainingById event, Emitter<TrainingState> emit) async {
    emit(TrainingLoading());
    try {
      final training = trainingRepository.getTrainingById(event.id);
      if (training != null) {
        emit(TrainingDetailsLoaded(training));
      } else {
        emit(TrainingError('Training not found.'));
      }
    } catch (e) {
      emit(TrainingError('Failed to load training details.'));
    }
  }

  Future<void> _onUpdateSelectedFilters(
      UpdateSelectedFilters event, Emitter<TrainingState> emit) async {
    final currentState = state;
    if (currentState is TrainingLoaded) {
      switch (event.filterType) {
        case FilterType.location:
          emit(currentState.copyWith(selectedLocations: event.selectedItems));
          break;
        case FilterType.trainingName:
          emit(currentState.copyWith(
              selectedTrainingNames: event.selectedItems));
          break;
        case FilterType.trainerName:
          emit(
              currentState.copyWith(selectedTrainerNames: event.selectedItems));
          break;
      }
    }
  }

  Future<void> _onFilterTrainings(
      FilterTrainings event, Emitter<TrainingState> emit) async {
    final currentState = state;
    if (currentState is TrainingLoaded) {
      try {
        final filteredTrainings = trainingRepository.filterTrainings(
          locations: currentState.selectedLocations,
          trainingNames: currentState.selectedTrainingNames,
          trainerNames: currentState.selectedTrainerNames,
        );

        emit(currentState.copyWith(filteredTrainings: filteredTrainings));
      } catch (e) {
        emit(TrainingError('Failed to apply filters.'));
      }
    }
  }

  Future<void> _onFetchFilterItems(
      FetchFilterItems event, Emitter<TrainingState> emit) async {
    final currentState = state;
    if (currentState is TrainingLoaded) {
      emit(TrainingLoading());
      try {
        List<String> filterItems = [];

        switch (event.filterType) {
          case FilterType.location:
            filterItems = trainingRepository.getAllLocations();
            break;
          case FilterType.trainingName:
            filterItems = trainingRepository.getAllTrainingNames();
            break;
          case FilterType.trainerName:
            filterItems = trainingRepository.getAllTrainerNames();
            break;
        }

        emit(currentState.copyWith(
          filterItems: filterItems,
          selectedFilter: event.filterType,
        ));
      } catch (e) {
        emit(TrainingError('Failed to load filter items.'));
      }
    }
  }
}
