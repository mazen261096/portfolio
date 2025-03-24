import '../../domain/entities/experience.dart';

class ExperienceModel extends Experience {
  ExperienceModel({
    required super.id,
    required super.companyName,
    required super.logoUrl,
    required super.role,
    required super.description,
    required super.startDate,
    required super.endDate,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      id: json['id'],
      companyName: json['companyName'],
      logoUrl: json['logoUrl'],
      role: json['role'],
      description: json['description'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'companyName': companyName,
      'logoUrl': logoUrl,
      'role': role,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }


}
