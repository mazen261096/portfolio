

import 'package:dartz/dartz.dart';
import 'package:portfolio/portfolio_module/domain/entities/project.dart';

import '../../../../core/utils/failure.dart';
import '../../entities/project.dart';
import '../../repository/base_portfolio_repository.dart';

class AddProjectUseCase{
  final BasePortfolioRepository portfolioRepository ;
  AddProjectUseCase (this.portfolioRepository);

  Future<Either<Failure,void>> execute(Map<String,dynamic> projectMap) async {
    return await portfolioRepository.addProject(projectMap);
  }
  
}