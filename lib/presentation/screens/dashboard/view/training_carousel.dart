import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_trainings_app/core/constants/route_constants.dart';
import 'package:my_trainings_app/core/constants/string_constants.dart';
import 'package:my_trainings_app/data/model/training_model.dart';
import 'package:my_trainings_app/domain/utils/date_formatter.dart';
import 'package:my_trainings_app/presentation/screens/dashboard/bloc/training_bloc.dart';
import 'package:my_trainings_app/presentation/screens/dashboard/bloc/training_event.dart';
import 'package:my_trainings_app/presentation/screens/dashboard/bloc/training_state.dart';

class TrainingCarousel extends StatefulWidget {
  const TrainingCarousel({super.key});

  @override
  TrainingCarouselState createState() => TrainingCarouselState();
}

class TrainingCarouselState extends State<TrainingCarousel> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  void _moveToNext() {
    _carouselController.nextPage();
  }

  void _moveToPrevious() {
    _carouselController.previousPage();
  }

  @override
  void initState() {
    super.initState();
    context.read<TrainingBloc>().add((FetchAllTrainings()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingBloc, TrainingState>(
      builder: (context, state) {
        if (state is TrainingLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TrainingLoaded) {
          final trainings = state.allTrainings;

          return Stack(
            children: [
              CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: trainings.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  final training = trainings[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        RouteConstants.trainingDetailsPath,
                        arguments: training,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(140, 132, 120, 129),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title(training),
                          location(training),
                          const Spacer(),
                          cost(training),
                          viewDetailsButton(context, training),
                        ],
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 200,
                  enlargeCenterPage: true,
                  autoPlay: false,
                  aspectRatio: 1,
                  viewportFraction: 0.8,
                ),
              ),
              leftIcon(),
              rightIcon(),
            ],
          );
        } else if (state is TrainingError) {
          return Center(
            child:
                Text('${StringConstants.failedToLoad} ${state.errorMessage}'),
          );
        }
        return const Center(child: Text(StringConstants.noTrainingsAvailable));
      },
    );
  }

  Positioned rightIcon() {
    return Positioned(
      right: 0,
      top: 60,
      child: IconButton(
        icon: const Icon(Icons.arrow_forward, color: Colors.white),
        onPressed: _moveToNext,
      ),
    );
  }

  Positioned leftIcon() {
    return Positioned(
      left: 0,
      top: 60,
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: _moveToPrevious,
      ),
    );
  }

  Padding cost(Training training) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        '\$${training.cost.toStringAsFixed(2)}',
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 241, 28, 13)),
      ),
    );
  }

  Padding location(Training training) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        '${training.location} | ${formatTrainingDate(training.trainingFromDate, training.trainingToDate)}',
        style: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }

  Padding title(Training training) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Text(
        training.title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  InkWell viewDetailsButton(BuildContext context, Training training) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          RouteConstants.trainingDetailsPath,
          arguments: training,
        );
      },
      child: const Padding(
        padding: EdgeInsets.only(right: 8.0, bottom: 12.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                StringConstants.viewDetails,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
