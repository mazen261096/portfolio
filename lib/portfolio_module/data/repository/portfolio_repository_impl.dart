import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/portfolio.dart';
import '../../domain/entities/personal_info.dart';
import '../../domain/entities/contact_info.dart';
import '../../domain/entities/experience.dart';
import '../../domain/entities/project.dart';
import '../../domain/repository/portfolio_repository.dart';
import '../datasource/portfolio_data_source.dart';
import '../models/portfolio_model.dart';
import '../models/personal_info_model.dart';
import '../models/contact_info_model.dart';
import '../models/experience_model.dart';
import '../models/project_model.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioDataSource dataSource;

  PortfolioRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, Portfolio>> getPortfolioData() async {
    try {
      final data = await dataSource.getPortfolioData();
      return Right(PortfolioModel.fromJson(data));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  // Personal Info
  @override
  Future<Either<Failure, void>> addPersonalInfo(PersonalInfo personalInfo) async {
    try {
      await dataSource.addOrUpdatePersonalInfo(PersonalInfoModel.fromEntity(personalInfo));
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deletePersonalInfo() async {
    try {
      await dataSource.deletePersonalInfo();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  // Contact Info
  @override
  Future<Either<Failure, void>> addContactInfo(ContactInfo contactInfo) async {
    try {
      await dataSource.addOrUpdateContactInfo(ContactInfoModel.fromEntity(contactInfo));
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteContactInfo(String contactId) async {
    try {
      await dataSource.deleteContactInfo(contactId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  // Experience
  @override
  Future<Either<Failure, void>> addExperience(Experience experience) async {
    try {
      await dataSource.addOrUpdateExperience(ExperienceModel.fromEntity(experience));
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteExperience(String experienceId) async {
    try {
      await dataSource.deleteExperience(experienceId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  // Project
  @override
  Future<Either<Failure, void>> addProject(Project project) async {
    try {
      await dataSource.addOrUpdateProject(ProjectModel.fromEntity(project));
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProject(String projectId) async {
    try {
      await dataSource.deleteProject(projectId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateContactInfo(ContactInfo contactInfo) {
    // TODO: implement updateContactInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateExperience(Experience experience) {
    // TODO: implement updateExperience
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updatePersonalInfo(PersonalInfo personalInfo) {
    // TODO: implement updatePersonalInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateProject(Project project) {
    // TODO: implement updateProject
    throw UnimplementedError();
  }
}
