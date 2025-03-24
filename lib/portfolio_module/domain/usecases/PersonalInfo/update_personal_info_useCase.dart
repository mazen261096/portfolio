

import 'package:dartz/dartz.dart';
import 'package:portfolio/portfolio_module/domain/repository/base_portfolio_repository.dart';
import '../../../../core/utils/failure.dart';
import '../../entities/personal_info.dart';


class UpdatePersonalInfoUseCase{
  final BasePortfolioRepository portfolioRepository ;
  UpdatePersonalInfoUseCase (this.portfolioRepository);

  Future<Either<Failure,void>> execute(Map<String,dynamic> personalInfoMap) async {
    return await portfolioRepository.updatePersonalInfo(personalInfoMap);
  }
}

// Use case for: update_personal_info_useCase.dart