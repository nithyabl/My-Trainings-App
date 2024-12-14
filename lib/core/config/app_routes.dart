import 'package:flutter/material.dart';
import 'package:my_trainings_app/core/constants/route_constants.dart';
import 'package:my_trainings_app/data/model/training_model.dart';
import 'package:my_trainings_app/presentation/screens/dashboard/view/dashboard_screen.dart';
import 'package:my_trainings_app/presentation/screens/training_details/view/training_details_screen.dart';

class AppRoutes {
  Route generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (_) => displayView(routeSettings),
      settings: routeSettings,
    );
  }

  Widget displayView(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case RouteConstants.dashboardPath:
        return const DashboardScreen();
      case RouteConstants.trainingDetailsPath:
        if (args is Training) {
          return TrainingDetailsScreen(training: args);
        }
        return const DashboardScreen();

      default:
        return const DashboardScreen();
    }
  }
}
