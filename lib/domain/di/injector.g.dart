// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _registerRepositories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => TrainingRepository())
      ..registerSingleton((c) => TrainingBloc(c.resolve<TrainingRepository>()));
  }
}
