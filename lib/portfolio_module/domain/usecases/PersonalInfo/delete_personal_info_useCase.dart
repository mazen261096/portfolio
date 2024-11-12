// Use case for: delete_PersonalInfo_useCase.dart
// Use case for: add_PersonalInfo_useCase.dart

// Use case for: update_contact_info_useCase.dart

// Use case for: delete_contact_info_useCase.dart

import 'package:dartz/dartz.dart';
import 'package:portfolio/portfolio_module/domain/repository/portfolio_repository.dart';
import '../../../../core/error/failure.dart';

class DeletePersonalInfoUseCase{
  final PortfolioRepository portfolioRepository ;
  DeletePersonalInfoUseCase (this.portfolioRepository);

  Future<Either<Failure,void>> execute(String id) async {
    return await portfolioRepository.deletePersonalInfo();
  }
}// Use case for: delete_personal_info_useCase.dart