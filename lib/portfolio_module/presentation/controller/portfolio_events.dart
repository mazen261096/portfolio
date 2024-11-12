// portfolio_events.dart
import '../../domain/entities/contact_info.dart';
import '../../domain/entities/experience.dart';
import '../../domain/entities/personal_info.dart';
import '../../domain/entities/project.dart';

abstract class PortfolioEvent {}

class LoadPortfolioData extends PortfolioEvent {}

// Personal Info Events
class AddPersonalInfo extends PortfolioEvent {
  final PersonalInfo personalInfo;
  AddPersonalInfo(this.personalInfo);
}

class UpdatePersonalInfo extends PortfolioEvent {
  final PersonalInfo personalInfo;
  UpdatePersonalInfo(this.personalInfo);
}

class DeletePersonalInfo extends PortfolioEvent {
  final String id;
  DeletePersonalInfo(this.id);
}

// Contact Info Events
class AddContactInfo extends PortfolioEvent {
  final ContactInfo contactInfo;
  AddContactInfo(this.contactInfo);
}

class UpdateContactInfo extends PortfolioEvent {
  final ContactInfo contactInfo;
  UpdateContactInfo(this.contactInfo);
}

class DeleteContactInfo extends PortfolioEvent {
  final String contactId;
  DeleteContactInfo(this.contactId);
}

// Experience Events
class AddExperience extends PortfolioEvent {
  final Experience experience;
  AddExperience(this.experience);
}

class UpdateExperience extends PortfolioEvent {
  final Experience experience;
  UpdateExperience(this.experience);
}

class DeleteExperience extends PortfolioEvent {
  final String experienceId;
  DeleteExperience(this.experienceId);
}

// Project Events
class AddProject extends PortfolioEvent {
  final Project project;
  AddProject(this.project);
}

class UpdateProject extends PortfolioEvent {
  final Project project;
  UpdateProject(this.project);
}

class DeleteProject extends PortfolioEvent {
  final String projectId;
  DeleteProject(this.projectId);
}
