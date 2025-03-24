// Use case for: update_contact_info_useCase.dart

// Use case for: delete_contact_info_useCase.dart

import 'package:dartz/dartz.dart';
import 'package:portfolio/portfolio_module/domain/entities/contact_info.dart';
import 'package:portfolio/portfolio_module/domain/repository/base_portfolio_repository.dart';

import '../../../../core/utils/failure.dart';

class UpdateContactInfoUseCase{
  final BasePortfolioRepository portfolioRepository ;
  UpdateContactInfoUseCase (this.portfolioRepository);

  Future<Either<Failure,void>> execute(Map<String,dynamic> contactInfoMap) async {
    return await portfolioRepository.updateContactInfo(contactInfoMap);
  }
}