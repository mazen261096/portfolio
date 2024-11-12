

import 'package:dartz/dartz.dart';
import 'package:portfolio/portfolio_module/domain/repository/portfolio_repository.dart';
import '../../../../core/error/failure.dart';
import '../../entities/personal_info.dart';


class UpdatePersonalInfoUseCase{
  final PortfolioRepository portfolioRepository ;
  UpdatePersonalInfoUseCase (this.portfolioRepository);

  Future<Either<Failure,void>> execute(PersonalInfo personalInfo) async {
    return await portfolioRepository.updatePersonalInfo(personalInfo);
  }
}

// Use case for: update_personal_info_useCase.dart