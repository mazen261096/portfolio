// Use case for: add_contact_info_useCase.dart
import 'package:dartz/dartz.dart';
import 'package:portfolio/portfolio_module/domain/entities/contact_info.dart';
import 'package:portfolio/portfolio_module/domain/repository/base_portfolio_repository.dart';

import '../../../../core/utils/failure.dart';

class AddContactInfoUseCase{
  final BasePortfolioRepository portfolioRepository ;
  AddContactInfoUseCase (this.portfolioRepository);

  Future<Either<Failure,void>> execute(Map<String,dynamic> contactInfoMap) async {
    return await portfolioRepository.addContactInfo(contactInfoMap);
  }
}