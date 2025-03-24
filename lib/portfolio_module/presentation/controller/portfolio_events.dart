
import 'package:flutter/material.dart';

abstract class PortfolioEvent {}

class ScrollUpdated extends PortfolioEvent {
  final double offset;
  ScrollUpdated(this.offset);
}

class ScrollToSection extends PortfolioEvent {
  final GlobalKey key;
  ScrollToSection(this.key);
}

class LoadPortfolioData extends PortfolioEvent {}

// Personal Info Events
class AddPersonalInfo extends PortfolioEvent {
  final Map<String,dynamic> personalInfo;
  AddPersonalInfo(this.personalInfo);
}

class UpdatePersonalInfo extends PortfolioEvent {
  final Map<String,dynamic> personalInfo;
  UpdatePersonalInfo(this.personalInfo);
}

class DeletePersonalInfo extends PortfolioEvent {
  final String id;
  DeletePersonalInfo(this.id);
}

// Contact Info Events
class AddContactInfo extends PortfolioEvent {
  final Map<String,dynamic> contactInfo;
  AddContactInfo(this.contactInfo);
}

class UpdateContactInfo extends PortfolioEvent {
  final Map<String,dynamic> contactInfo;
  UpdateContactInfo(this.contactInfo);
}

class DeleteContactInfo extends PortfolioEvent {
  final String contactId;
  DeleteContactInfo(this.contactId);
}

// Experience Events
class AddExperience extends PortfolioEvent {
  final Map<String,dynamic> experience;
  AddExperience(this.experience);
}

class UpdateExperience extends PortfolioEvent {
  final Map<String,dynamic> experience;
  UpdateExperience(this.experience);
}

class DeleteExperience extends PortfolioEvent {
  final String experienceId;
  DeleteExperience(this.experienceId);
}

// Project Events
class AddProject extends PortfolioEvent {
  final Map<String,dynamic> project;
  AddProject(this.project);
}

class UpdateProject extends PortfolioEvent {
  final Map<String,dynamic> project;
  UpdateProject(this.project);
}

class DeleteProject extends PortfolioEvent {
  final String projectId;
  DeleteProject(this.projectId);
}


