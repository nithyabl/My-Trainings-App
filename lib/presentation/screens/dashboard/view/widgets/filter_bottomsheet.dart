import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_trainings_app/core/constants/string_constants.dart';
import 'package:my_trainings_app/core/enums/filter_type_enum.dart';
import 'package:my_trainings_app/presentation/screens/dashboard/bloc/training_bloc.dart';
import 'package:my_trainings_app/presentation/screens/dashboard/bloc/training_event.dart';
import 'package:my_trainings_app/presentation/screens/dashboard/bloc/training_state.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TrainingBloc, TrainingState>(
      listener: (context, state) {},
      child: BlocBuilder<TrainingBloc, TrainingState>(
        builder: (context, state) {
          if (state is TrainingLoaded) {
            return Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16.0),
                  ),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        title(),
                        Container(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              filterButtons(context, state),
                              const SizedBox(width: 20),
                              filterItems(state, context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state is TrainingLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(
                child: Text(StringConstants.somethingWentWrong));
          }
        },
      ),
    );
  }

  Padding title() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(
        StringConstants.filters,
        style: TextStyle(
            fontSize: 22, color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
  }

  Expanded filterItems(TrainingLoaded state, BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (state.selectedFilter == FilterType.location)
            _buildFilterItems(context, FilterType.location, state),
          if (state.selectedFilter == FilterType.trainingName)
            _buildFilterItems(context, FilterType.trainingName, state),
          if (state.selectedFilter == FilterType.trainerName)
            _buildFilterItems(context, FilterType.trainerName, state),
        ],
      ),
    );
  }

  Column filterButtons(BuildContext context, TrainingLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _filterButton(context, FilterType.location, state),
        _filterButton(context, FilterType.trainingName, state),
        _filterButton(context, FilterType.trainerName, state),
      ],
    );
  }

  Widget _filterButton(
      BuildContext context, FilterType filterType, TrainingLoaded state) {
    final isSelected = state.selectedFilter == filterType;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.red : Colors.grey[200],
          foregroundColor: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: () {
          context.read<TrainingBloc>().add(FetchFilterItems(filterType));
        },
        child: Text(filterType.toReadableString()),
      ),
    );
  }

  Widget _buildFilterItems(
      BuildContext context, FilterType filterType, TrainingLoaded state) {
    final selectedItems = _getSelectedItemsForFilterType(filterType, state);

    return Column(
      children: state.filterItems.map((item) {
        return CheckboxListTile(
          title: Text(item),
          activeColor: Colors.red,
          value: selectedItems.contains(item),
          onChanged: (isSelected) {
            final updatedItems = List<String>.from(selectedItems);

            if (isSelected == true) {
              updatedItems.add(item);
            } else {
              updatedItems.remove(item);
            }

            context.read<TrainingBloc>().add(
                  UpdateSelectedFilters(
                    filterType: filterType,
                    selectedItems: updatedItems,
                  ),
                );
            context.read<TrainingBloc>().add(FilterTrainings(
                  selectedFilter: filterType.toReadableString(),
                  locations: filterType == FilterType.location
                      ? updatedItems
                      : state.selectedLocations,
                  trainingNames: filterType == FilterType.trainingName
                      ? updatedItems
                      : state.selectedTrainingNames,
                  trainerNames: filterType == FilterType.trainerName
                      ? updatedItems
                      : state.selectedTrainerNames,
                ));
          },
        );
      }).toList(),
    );
  }

  List<String> _getSelectedItemsForFilterType(
      FilterType filterType, TrainingLoaded state) {
    switch (filterType) {
      case FilterType.location:
        return state.selectedLocations;
      case FilterType.trainingName:
        return state.selectedTrainingNames;
      case FilterType.trainerName:
        return state.selectedTrainerNames;
      default:
        return [];
    }
  }
}
