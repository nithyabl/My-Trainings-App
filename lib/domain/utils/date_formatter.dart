import 'package:intl/intl.dart';

String formatTrainingDate(DateTime fromDate, DateTime toDate) {
  final dateFormat = DateFormat('MMM dd');
  return '${dateFormat.format(fromDate)} - ${dateFormat.format(toDate)}';
}
