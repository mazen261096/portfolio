// Use case for: delete_experience_useCase.dart
// Use case for: add_experience_useCase.dart

// Use case for: update_contact_info_useCase.dart

// Use case for: delete_contact_info_useCase.dart

import 'package:dartz/dartz.dart';
import 'package:portfolio/portfolio_module/domain/entities/contact_info.dart';
import 'package:portfolio/portfolio_module/domain/entities/experience.dart';
import 'package:portfolio/portfolio_module/domain/repository/portfolio_repository.dart';

import '../../../../core/error/failure.dart';

class DeleteExperienceUseCase{
  final PortfolioRepository portfolioRepository ;
  DeleteExperienceUseCase (this.portfolioRepository);

  Future<Either<Failure,void>> execute(String id) async {
    return await portfolioRepository.deleteExperience(id);
  }
}