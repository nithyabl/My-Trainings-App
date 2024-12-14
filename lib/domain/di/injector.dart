import 'package:kiwi/kiwi.dart';

import 'package:my_trainings_app/domain/repo/training_repo.dart';
import 'package:my_trainings_app/presentation/screens/dashboard/bloc/training_bloc.dart';

part 'injector.g.dart';

abstract class Injector {
  static late KiwiContainer container;

  static Future<bool> setup() async {
    container = KiwiContainer();

    _$Injector()._configure();

    return true;
  }

  static final T Function<T>([String]) resolve = container.resolve;

  void _configure() {
    _registerRepositories();
  }

  /// Register repository and Bloc

  @Register.singleton(TrainingRepository)
  @Register.singleton(TrainingBloc)
  void _registerRepositories();
}
