
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/settings_module/data/repositories/settings_repository.dart';
import 'package:portfolio/settings_module/domain/usecases/get_current_settings.dart';
import 'package:portfolio/settings_module/domain/usecases/update_language_usecase.dart';
import 'package:portfolio/settings_module/domain/usecases/update_theme_usecase.dart';

import '../../portfolio_module/data/datasource/portfolio_data_source.dart';
import '../../portfolio_module/data/repository/portfolio_repository_impl.dart';
import '../../portfolio_module/domain/repository/portfolio_repository.dart';
import '../../portfolio_module/domain/usecases/ContactInfo/add_contact_info_useCase.dart';
import '../../portfolio_module/domain/usecases/ContactInfo/delete_contact_info_useCase.dart';
import '../../portfolio_module/domain/usecases/ContactInfo/update_contact_info_useCase.dart';
import '../../portfolio_module/domain/usecases/Experience/add_experience_useCase.dart';
import '../../portfolio_module/domain/usecases/Experience/delete_experience_useCase.dart';
import '../../portfolio_module/domain/usecases/Experience/update_experience_useCase.dart';
import '../../portfolio_module/domain/usecases/PersonalInfo/add_personal_info_useCase.dart';
import '../../portfolio_module/domain/usecases/PersonalInfo/delete_personal_info_useCase.dart';
import '../../portfolio_module/domain/usecases/PersonalInfo/get_portfolio_data_useCase.dart';
import '../../portfolio_module/domain/usecases/PersonalInfo/update_personal_info_useCase.dart';
import '../../portfolio_module/domain/usecases/Project/add_project_useCase.dart';
import '../../portfolio_module/domain/usecases/Project/delete_project_useCase.dart';
import '../../portfolio_module/domain/usecases/Project/update_project_useCase.dart';
import '../../portfolio_module/presentation/controller/portfolio_bloc.dart';
import '../../portfolio_module/presentation/controller/portfolio_events.dart';
import '../../settings_module/presentation/controller/settings_bloc.dart';


final sl =GetIt.instance;
 class ServiceLocator {

   static void initSl (){
     sl.registerLazySingleton<SettingsBloc>(()=>SettingsBloc(sl(),sl(),sl()));
     sl.registerLazySingleton<SettingsRepository>(()=>SettingsRepository());
     sl.registerLazySingleton<GetCurrentSettingsUseCase>(()=>GetCurrentSettingsUseCase(sl()));
     sl.registerLazySingleton<UpdateLanguageUseCase>(()=>UpdateLanguageUseCase(sl()));
     sl.registerLazySingleton<UpdateThemeUseCase>(()=>UpdateThemeUseCase(sl()));



     // Bloc
     sl.registerFactory<PortfolioBloc>(() => PortfolioBloc(sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl()));
     // Data Source
     sl.registerLazySingleton<PortfolioDataSource>(() => PortfolioDataSource(sl()));
     // Repository
     sl.registerLazySingleton<PortfolioRepository>(() => PortfolioRepositoryImpl(sl()));
     // Use Cases
     sl.registerLazySingleton<AddContactInfoUseCase>(() => AddContactInfoUseCase(sl()));
     sl.registerLazySingleton<UpdateContactInfoUseCase>(() => UpdateContactInfoUseCase(sl()));
     sl.registerLazySingleton<DeleteContactInfoUseCase>(() => DeleteContactInfoUseCase(sl()));

     sl.registerLazySingleton<AddPersonalInfoUseCase>(() => AddPersonalInfoUseCase(sl()));
     sl.registerLazySingleton<UpdatePersonalInfoUseCase>(() => UpdatePersonalInfoUseCase(sl()));
     sl.registerLazySingleton<DeletePersonalInfoUseCase>(() => DeletePersonalInfoUseCase(sl()));

     sl.registerLazySingleton<AddProjectUseCase>(() => AddProjectUseCase(sl()));
     sl.registerLazySingleton<UpdateProjectUseCase>(() => UpdateProjectUseCase(sl()));
     sl.registerLazySingleton<DeleteProjectUseCase>(() => DeleteProjectUseCase(sl()));

     sl.registerLazySingleton<GetPortfolioDataUseCase>(() => GetPortfolioDataUseCase(sl()));

     sl.registerLazySingleton<AddExperienceUseCase>(() => AddExperienceUseCase(sl()));
     sl.registerLazySingleton<UpdateExperienceUseCase>(() => UpdateExperienceUseCase(sl()));
     sl.registerLazySingleton<DeleteExperienceUseCase>(() => DeleteExperienceUseCase(sl()));



   }
 }