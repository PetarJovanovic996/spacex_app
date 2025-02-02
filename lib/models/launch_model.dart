import 'package:equatable/equatable.dart';

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
  final String? details;

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
        id: json['id'],
        name: json['name'],
        date: DateTime.parse(json['date_utc']),
        success: json['success'] ?? false,
        details: json['details']);
  }
  @override
  List<Object?> get props => [id, name, date, success, details];
}
