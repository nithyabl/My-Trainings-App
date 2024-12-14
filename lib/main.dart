import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_trainings_app/core/config/app_routes.dart';
import 'package:my_trainings_app/core/config/navigator_key.dart';
import 'package:my_trainings_app/core/constants/route_constants.dart';
import 'package:my_trainings_app/core/constants/string_constants.dart';
import 'package:my_trainings_app/domain/di/injector.dart';
import 'package:my_trainings_app/presentation/screens/dashboard/bloc/training_bloc.dart';

void main() async {
  await Injector.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final trainingBloc = Injector.container.resolve<TrainingBloc>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => trainingBloc,
        ),
      ],
      child: MaterialApp(
        title: StringConstants.appName,
        navigatorKey: appNavigatorKey,
        onGenerateRoute: AppRoutes().generateRoute,
        initialRoute: RouteConstants.dashboardPath,
      ),
    );
  }
}
