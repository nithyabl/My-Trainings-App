import 'package:flutter/material.dart';

class Training {
  final int id;
  final String title;
  final String trainerName;
  final String location;
  final String summary;
  final double cost;
  final DateTime trainingFromDate;
  final DateTime trainingToDate;
  final String prerequisites;
  final String contactInfo;
  final Color color;

  Training({
    required this.id,
    required this.title,
    required this.trainerName,
    required this.location,
    required this.summary,
    required this.cost,
    required this.trainingFromDate,
    required this.trainingToDate,
    required this.prerequisites,
    required this.contactInfo,
    required this.color,
  });

  factory Training.fromJson(Map<String, dynamic> json) {
    return Training(
      id: json['id'],
      title: json['title'],
      trainerName: json['trainerName'],
      location: json['location'],
      summary: json['summary'],
      cost: json['cost'],
      trainingFromDate: DateTime.parse(json['trainingFromDate']),
      trainingToDate: DateTime.parse(json['trainingToDate']),
      prerequisites: json['prerequisites'],
      contactInfo: json['contactInfo'],
      color: _fromJsonColor(json['color']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'trainerName': trainerName,
      'location': location,
      'summary': summary,
      'cost': cost,
      'trainingFromDate': trainingFromDate.toIso8601String(),
      'trainingToDate': trainingToDate.toIso8601String(),
      'prerequisites': prerequisites,
      'contactInfo': contactInfo,
      'color': _toJsonColor(color),
    };
  }

  static String _toJsonColor(Color color) {
    return color.value.toRadixString(16).padLeft(8, '0');
  }

  static Color _fromJsonColor(String colorStr) {
    return Color(int.parse(colorStr, radix: 16));
  }
}
