// repository/base_portfolio_repository.dart
import 'package:dartz/dartz.dart';

import '../../../core/utils/failure.dart';
import '../entities/contact_info.dart';
import '../entities/experience.dart';
import '../entities/personal_info.dart';
import '../entities/portfolio.dart';
import '../entities/project.dart';

abstract class BasePortfolioRepository {
  Future<Either<Failure, Portfolio>> getPortfolioData();
  Future<Either<Failure, void>> addPersonalInfo(Map<String,dynamic> personalInfoMap);
  Future<Either<Failure, void>> updatePersonalInfo(Map<String,dynamic> personalInfoMap);
  Future<Either<Failure, void>> deletePersonalInfo(String id);

  Future<Either<Failure, void>> addContactInfo(Map<String,dynamic> contactInfoMap);
  Future<Either<Failure, void>> updateContactInfo(Map<String,dynamic> contactInfoMap);
  Future<Either<Failure, void>> deleteContactInfo(String contactId);

  Future<Either<Failure, void>> addExperience(Map<String,dynamic> experienceMap);
  Future<Either<Failure, void>> updateExperience(Map<String,dynamic> experienceMap);
  Future<Either<Failure, void>> deleteExperience(String experienceId);

  Future<Either<Failure, void>> addProject(Map<String,dynamic> projectMap);
  Future<Either<Failure, void>> updateProject(Map<String,dynamic> projectMap);
  Future<Either<Failure, void>> deleteProject(String projectId);
}
