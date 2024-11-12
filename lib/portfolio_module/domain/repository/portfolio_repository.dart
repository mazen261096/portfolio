// repository/portfolio_repository.dart
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/contact_info.dart';
import '../entities/experience.dart';
import '../entities/personal_info.dart';
import '../entities/portfolio.dart';
import '../entities/project.dart';

abstract class PortfolioRepository {
  Future<Either<Failure, Portfolio>> getPortfolioData();
  Future<Either<Failure, void>> addPersonalInfo(PersonalInfo personalInfo);
  Future<Either<Failure, void>> updatePersonalInfo(PersonalInfo personalInfo);
  Future<Either<Failure, void>> deletePersonalInfo();

  Future<Either<Failure, void>> addContactInfo(ContactInfo contactInfo);
  Future<Either<Failure, void>> updateContactInfo(ContactInfo contactInfo);
  Future<Either<Failure, void>> deleteContactInfo(String contactId);

  Future<Either<Failure, void>> addExperience(Experience experience);
  Future<Either<Failure, void>> updateExperience(Experience experience);
  Future<Either<Failure, void>> deleteExperience(String experienceId);

  Future<Either<Failure, void>> addProject(Project project);
  Future<Either<Failure, void>> updateProject(Project project);
  Future<Either<Failure, void>> deleteProject(String projectId);
}
