enum FilterType { location, trainingName, trainerName }

extension FilterTypeStringExtension on String {
  FilterType toFilterType() {
    switch (this) {
      case 'Location':
        return FilterType.location;
      case 'Training Name':
        return FilterType.trainingName;
      case 'Trainer Name':
        return FilterType.trainerName;
      default:
        return FilterType.location;
    }
  }
}

extension FilterTypeExtension on FilterType {
  String toReadableString() {
    switch (this) {
      case FilterType.location:
        return 'Location';
      case FilterType.trainingName:
        return 'Training Name';
      case FilterType.trainerName:
        return 'Trainer Name';
    }
  }
}
