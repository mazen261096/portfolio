// Use case for: update_contact_info_useCase.dart

// Use case for: delete_contact_info_useCase.dart

import 'package:dartz/dartz.dart';
import 'package:portfolio/portfolio_module/domain/entities/contact_info.dart';
import 'package:portfolio/portfolio_module/domain/repository/portfolio_repository.dart';

import '../../../../core/error/failure.dart';

class UpdateContactInfoUseCase{
  final PortfolioRepository portfolioRepository ;
  UpdateContactInfoUseCase (this.portfolioRepository);

  Future<Either<Failure,void>> execute(ContactInfo contactInfo) async {
    return await portfolioRepository.updateContactInfo(contactInfo);
  }
}