import 'contact_info_model.dart';
import 'experience_model.dart';
import 'personal_info_model.dart';
import 'project_model.dart';
import '../../domain/entities/portfolio.dart';

class PortfolioModel extends Portfolio {
  PortfolioModel({
    required super.contactInfo,
    required super.experience,
    required super.personalInfo,
    required super.project,
  });

  factory PortfolioModel.fromJson(Map<String, dynamic> json) {
    return PortfolioModel(
      contactInfo: ContactInfoModel.fromJson(json['contactInfo']),
      experience: ExperienceModel.fromJson(json['experience']),
      personalInfo: PersonalInfoModel.fromJson(json['personalInfo']),
      project: ProjectModel.fromJson(json['project']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contactInfo': (contactInfo as ContactInfoModel).toJson(),
      'experience': (experience as ExperienceModel).toJson(),
      'personalInfo': (personalInfo as PersonalInfoModel).toJson(),
      'project': (project as ProjectModel).toJson(),
    };
  }
}
