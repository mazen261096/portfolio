

import 'package:dartz/dartz.dart';
import 'package:portfolio/portfolio_module/domain/entities/project.dart';

import '../../../../core/error/failure.dart';
import '../../entities/project.dart';
import '../../repository/portfolio_repository.dart';

class AddProjectUseCase{
  final PortfolioRepository portfolioRepository ;
  AddProjectUseCase (this.portfolioRepository);

  Future<Either<Failure,void>> execute(Project project) async {
    return await portfolioRepository.addProject(project);
  }
  
}