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
    required super.projects,
  });

  factory PortfolioModel.fromJson(Map<String, dynamic> json) {
    return PortfolioModel(
      contactInfo:(json['contactInfo'] as List<dynamic>).map((item)=>ContactInfoModel.fromJson(item)).toList(),
      experience: (json['experience'] as List<dynamic>).map((item)=>ExperienceModel.fromJson(item)).toList(),
      personalInfo: PersonalInfoModel.fromJson(json['personalInfo']),
      projects:(json['project'] as List<dynamic>).map((item)=>ProjectModel.fromJson(item)).toList() ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contactInfo': (contactInfo as ContactInfoModel).toJson(),
      'experience': (experience as ExperienceModel).toJson(),
      'personalInfo': (personalInfo as PersonalInfoModel).toJson(),
      'project': (projects as List<ProjectModel>).map((project)=>project.toJson()).toList(),
    };
  }


}
