import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Launch extends Equatable {
  const Launch({
    required this.id,
    required this.name,
    required this.date,
    required this.success,
    required this.details,
  });
  final String id;
  final String name;
  final DateTime date;
  final bool success;
  final String details;

  String get formattedDate {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  // BONUS TIP: Use [json_serializable] package instead of hand writing toJson & fromJson
  // this will allow you to generate them immediately, rather than writing them on your own,
  // which saves you time!
  // https://pub.dev/packages/json_serializable
  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
        id: json['id'] ?? 'No id generated',
        name: json['name'] ?? 'Name Unknown',
        date: DateTime.parse(json['date_utc'] ?? 'No date appointed'),
        success: json['success'] ?? false,
        details: json['details'] ?? 'No details available');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'date_utc': date.toIso8601String(),
      'success': success,
      'details': details,
    };
  }

  @override
  List<Object?> get props => [id, name, date, success, details];
}
