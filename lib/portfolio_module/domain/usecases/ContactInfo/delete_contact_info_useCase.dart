// Use case for: delete_contact_info_useCase.dart

import 'package:dartz/dartz.dart';
import 'package:portfolio/portfolio_module/domain/entities/contact_info.dart';
import 'package:portfolio/portfolio_module/domain/repository/base_portfolio_repository.dart';

import '../../../../core/utils/failure.dart';

class DeleteContactInfoUseCase{
  final BasePortfolioRepository portfolioRepository ;
  DeleteContactInfoUseCase (this.portfolioRepository);

  Future<Either<Failure,void>> execute(String contactId) async {
    return await portfolioRepository.deleteContactInfo(contactId);
  }
}