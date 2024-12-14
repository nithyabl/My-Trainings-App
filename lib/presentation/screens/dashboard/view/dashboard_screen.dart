import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_trainings_app/core/constants/string_constants.dart';
import 'package:my_trainings_app/presentation/screens/dashboard/bloc/training_bloc.dart';
import 'package:my_trainings_app/presentation/screens/dashboard/bloc/training_event.dart';
import 'package:my_trainings_app/presentation/screens/dashboard/bloc/training_state.dart';
import 'package:my_trainings_app/presentation/screens/dashboard/view/training_carousel.dart';
import 'package:my_trainings_app/presentation/screens/dashboard/view/widgets/filter_bottomsheet.dart';
import 'package:my_trainings_app/presentation/screens/dashboard/view/widgets/filtered_trainings_list.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TrainingBloc>().add(FetchAllTrainings());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DeferredPointerHandler(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        header(),
                      ],
                    ),
                    const Positioned(
                      top: 140,
                      left: 0,
                      right: 0,
                      child: DeferPointer(
                        child: TrainingCarousel(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70),
              filterButton(context),
              Expanded(
                child: BlocBuilder<TrainingBloc, TrainingState>(
                  builder: (context, state) {
                    if (state is TrainingLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is TrainingError) {
                      return Center(child: Text(state.errorMessage));
                    } else if (state is TrainingLoaded) {
                      return FilteredTrainingsList(
                        filteredTrainings: state.filteredTrainings,
                      );
                    } else {
                      return const Center(
                          child: Text(StringConstants.noTrainingsAvailable));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container header() {
    return Container(
      width: double.infinity,
      color: Colors.red,
      height: 280,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConstants.trainings,
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            StringConstants.highlights,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Padding filterButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          _showFilterBottomSheet(context);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.filter_list,
                  color: Colors.black,
                ),
                SizedBox(width: 8.0),
                Text(
                  StringConstants.filter,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(155, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) => const FilterBottomSheet(),
      ),
    );
  }
}
