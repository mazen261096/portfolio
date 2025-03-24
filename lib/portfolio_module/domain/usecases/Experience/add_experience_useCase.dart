// Use case for: add_experience_useCase.dart

// Use case for: update_contact_info_useCase.dart

// Use case for: delete_contact_info_useCase.dart

import 'package:dartz/dartz.dart';
import 'package:portfolio/portfolio_module/domain/entities/contact_info.dart';
import 'package:portfolio/portfolio_module/domain/entities/experience.dart';
import 'package:portfolio/portfolio_module/domain/repository/base_portfolio_repository.dart';

import '../../../../core/utils/failure.dart';

class AddExperienceUseCase{
  final BasePortfolioRepository portfolioRepository ;
  AddExperienceUseCase (this.portfolioRepository);

  Future<Either<Failure,void>> execute(Map<String,dynamic> experienceMap) async {
    return await portfolioRepository.addExperience(experienceMap);
  }
}