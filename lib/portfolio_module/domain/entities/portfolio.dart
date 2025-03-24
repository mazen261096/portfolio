import 'package:portfolio/portfolio_module/domain/entities/contact_info.dart';
import 'package:portfolio/portfolio_module/domain/entities/experience.dart';
import 'package:portfolio/portfolio_module/domain/entities/personal_info.dart';
import 'package:portfolio/portfolio_module/domain/entities/project.dart';

class Portfolio{
  List<ContactInfo> contactInfo ;
  List<Experience> experience ;
  PersonalInfo personalInfo ;
  List<Project> projects ;

  Portfolio({required this.contactInfo,required this.experience,required this.personalInfo,required this.projects});

}