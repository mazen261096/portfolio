// Use case for: add_contact_info_useCase.dart
import 'package:dartz/dartz.dart';
import 'package:portfolio/portfolio_module/domain/entities/contact_info.dart';
import 'package:portfolio/portfolio_module/domain/repository/portfolio_repository.dart';

import '../../../../core/error/failure.dart';

class AddContactInfoUseCase{
  final PortfolioRepository portfolioRepository ;
  AddContactInfoUseCase (this.portfolioRepository);

  Future<Either<Failure,void>> execute(ContactInfo contactInfo) async {
    return await portfolioRepository.addContactInfo(contactInfo);
  }
}