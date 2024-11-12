// Use case for: add_personal_info_useCase.dart

// Use case for: add_PersonalInfo_useCase.dart

// Use case for: update_contact_info_useCase.dart

// Use case for: delete_contact_info_useCase.dart

import 'package:dartz/dartz.dart';
import 'package:portfolio/portfolio_module/domain/entities/contact_info.dart';
import 'package:portfolio/portfolio_module/domain/repository/portfolio_repository.dart';

import '../../../../core/error/failure.dart';
import '../../entities/personal_info.dart';

class AddPersonalInfoUseCase{
  final PortfolioRepository portfolioRepository ;
  AddPersonalInfoUseCase (this.portfolioRepository);

  Future<Either<Failure,void>> execute(PersonalInfo personalInfo) async {
    return await portfolioRepository.addPersonalInfo(personalInfo);
  }
}