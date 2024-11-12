import 'package:portfolio/portfolio_module/domain/entities/contact_info.dart';
import 'package:portfolio/portfolio_module/domain/entities/experience.dart';
import 'package:portfolio/portfolio_module/domain/entities/personal_info.dart';
import 'package:portfolio/portfolio_module/domain/entities/project.dart';

class Portfolio{
  ContactInfo contactInfo ;
  Experience experience ;
  PersonalInfo personalInfo ;
  Project project ;

  Portfolio({required this.contactInfo,required this.experience,required this.personalInfo,required this.project});

}