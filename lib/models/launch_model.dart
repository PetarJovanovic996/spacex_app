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

// BONUS TIP: Use [json_serializable] package instead of hand writing toJson & fromJson
// this will allow you to generate them immediately, rather than writing them on your own,
// which saves you time!
// https://pub.dev/packages/json_serializable

// COMMENT:
//ON BONUS TIP
// dobio sam generisani kod automatski koji mi je naglasneno da se ne
//modifikuje / pa nisam ... ovo ces mi nedje objasnit
//vjerovatno ima opcija da se to rijesi
//problem je sto mi se ne dodaju ove vrijednosti ako je null
//pa mi povlacenje api puca / jer ima objekata sa null vrijednostima
// u svakom slucaju uspio sam da automatski generisem fajl
// imas ga u nastavku...

// Proci cemo ovo zajedno da ti pokazem, ali objekti koji imaju null polja na bekendu
// moraju da imaju ta ista polja oznacena kao nullable u modelu koji koristis za mapiranje

// dakle promjenom na String?, i ponovnim generisanjem json_serializable fajla, on ce to odraditi sam

// // // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'launch_model.dart';

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// Launch _$LaunchFromJson(Map<String, dynamic> json) => Launch(
//       id: json['id'] as String,
//       name: json['name'] as String,
//       date: DateTime.parse(json['date'] as String),
//       success: json['success'] as bool,
//       details: json['details'] as String,
//     );

// Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
//       'id': instance.id,
//       'name': instance.name,
//       'date': instance.date.toIso8601String(),
//       'success': instance.success,
//       'details': instance.details,
//     };

// ////MODEL MOJ

//     import 'package:equatable/equatable.dart';
// import 'package:intl/intl.dart';

// import 'package:json_annotation/json_annotation.dart';

// part 'launch_model.g.dart';

// @JsonSerializable()
// class Launch extends Equatable {
//   const Launch({
//     required this.id,
//     required this.name,
//     required this.date,
//     required this.success,
//     required this.details,
//   });

//   final String id;
//   final String name;
//   final DateTime date;
//   final bool success;
//   final String details;

//   String get formattedDate {
//     return DateFormat('dd/MM/yyyy').format(date);
//   }

//   factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);

//   Map<String, dynamic> toJson() => _$LaunchToJson(this);

//   @override
//   List<Object?> get props => [id, name, date, success, details];
// }
