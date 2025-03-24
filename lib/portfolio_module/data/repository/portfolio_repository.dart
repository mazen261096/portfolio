import 'package:dartz/dartz.dart';
import 'package:portfolio/auth_module/data/data_source/user_data_source.dart';
import '../../../core/utils/failure.dart';
import '../../domain/entities/portfolio.dart';
import '../../domain/entities/personal_info.dart';
import '../../domain/entities/contact_info.dart';
import '../../domain/entities/experience.dart';
import '../../domain/entities/project.dart';
import '../../domain/repository/base_portfolio_repository.dart';
import '../datasource/portfolio_data_source.dart';
import '../models/portfolio_model.dart';
import '../models/personal_info_model.dart';
import '../models/contact_info_model.dart';
import '../models/experience_model.dart';
import '../models/project_model.dart';

class PortfolioRepository implements BasePortfolioRepository {
  final BaseDataSource dataSource;

  PortfolioRepository(this.dataSource);

  @override
  Future<Either<Failure, void>> addContactInfo(Map<String, dynamic> contactInfoMap) {
    // TODO: implement addContactInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> addExperience(Map<String, dynamic> experienceMap) {
    // TODO: implement addExperience
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> addPersonalInfo(Map<String, dynamic> personalInfoMap) {
    // TODO: implement addPersonalInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> addProject(Map<String, dynamic> projectMap) {
    // TODO: implement addProject
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteContactInfo(String contactId) {
    // TODO: implement deleteContactInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteExperience(String experienceId) {
    // TODO: implement deleteExperience
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deletePersonalInfo(String id) {
    // TODO: implement deletePersonalInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteProject(String projectId) {
    // TODO: implement deleteProject
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Portfolio>> getPortfolioData() {
    // TODO: implement getPortfolioData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateContactInfo(Map<String, dynamic> contactInfoMap) {
    // TODO: implement updateContactInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateExperience(Map<String, dynamic> experienceMap) {
    // TODO: implement updateExperience
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updatePersonalInfo(Map<String, dynamic> personalInfoMap) {
    // TODO: implement updatePersonalInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateProject(Map<String, dynamic> projectMap) {
    // TODO: implement updateProject
    throw UnimplementedError();
  }


}
