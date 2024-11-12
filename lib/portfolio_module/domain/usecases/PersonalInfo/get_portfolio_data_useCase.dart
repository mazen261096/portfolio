// Use case for: add_personal_info_useCase.dart

// Use case for: add_PersonalInfo_useCase.dart

// Use case for: update_contact_info_useCase.dart

// Use case for: delete_contact_info_useCase.dart

import 'package:dartz/dartz.dart';
import 'package:portfolio/portfolio_module/domain/entities/contact_info.dart';
import 'package:portfolio/portfolio_module/domain/entities/portfolio.dart';
import 'package:portfolio/portfolio_module/domain/repository/portfolio_repository.dart';

import '../../../../core/error/failure.dart';
import '../../entities/personal_info.dart';

class GetPortfolioDataUseCase{
  final PortfolioRepository portfolioRepository ;
  GetPortfolioDataUseCase (this.portfolioRepository);

  Future<Either<Failure,Portfolio>> execute() async {
    return await portfolioRepository.getPortfolioData();
  }
}// Use case for: get_portfolio_data_useCase.dart