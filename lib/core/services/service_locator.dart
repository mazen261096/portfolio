
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/core/services/supabase_auth_service.dart';
import 'package:portfolio/settings_module/data/repositories/settings_repository.dart';
import 'package:portfolio/settings_module/domain/usecases/get_current_settings.dart';
import 'package:portfolio/settings_module/domain/usecases/update_language_usecase.dart';
import 'package:portfolio/settings_module/domain/usecases/update_theme_usecase.dart';

import '../../auth_module/data/data_source/user_data_source.dart';
import '../../auth_module/data/repository/user_repository.dart';
import '../../auth_module/domain/repository/base_user_repository.dart';
import '../../auth_module/domain/usecases/login_by_email_usecase.dart';
import '../../auth_module/domain/usecases/logout_usecase.dart';
import '../../auth_module/domain/usecases/register_by_email_usecase.dart';
import '../../auth_module/presentation/controller/auth_bloc.dart';
import '../../portfolio_module/data/datasource/portfolio_data_source.dart';
import '../../portfolio_module/data/repository/portfolio_repository.dart';
import '../../portfolio_module/domain/entities/contact_info.dart';
import '../../portfolio_module/domain/entities/experience.dart';
import '../../portfolio_module/domain/entities/personal_info.dart';
import '../../portfolio_module/domain/entities/portfolio.dart';
import '../../portfolio_module/domain/entities/project.dart';
import '../../portfolio_module/domain/repository/base_portfolio_repository.dart';
import '../../portfolio_module/domain/usecases/ContactInfo/add_contact_info_useCase.dart';
import '../../portfolio_module/domain/usecases/ContactInfo/delete_contact_info_useCase.dart';
import '../../portfolio_module/domain/usecases/ContactInfo/update_contact_info_useCase.dart';
import '../../portfolio_module/domain/usecases/Experience/add_experience_useCase.dart';
import '../../portfolio_module/domain/usecases/Experience/delete_experience_useCase.dart';
import '../../portfolio_module/domain/usecases/Experience/update_experience_useCase.dart';
import '../../portfolio_module/domain/usecases/PersonalInfo/add_personal_info_useCase.dart';
import '../../portfolio_module/domain/usecases/PersonalInfo/delete_personal_info_useCase.dart';
import '../../portfolio_module/domain/usecases/get_portfolio_data_useCase.dart';
import '../../portfolio_module/domain/usecases/PersonalInfo/update_personal_info_useCase.dart';
import '../../portfolio_module/domain/usecases/Project/add_project_useCase.dart';
import '../../portfolio_module/domain/usecases/Project/delete_project_useCase.dart';
import '../../portfolio_module/domain/usecases/Project/update_project_useCase.dart';
import '../../portfolio_module/presentation/controller/portfolio_bloc.dart';
import '../../portfolio_module/presentation/controller/portfolio_events.dart';
import '../../settings_module/presentation/controller/settings_bloc.dart';


final sl =GetIt.instance;
 class ServiceLocator {



   final Portfolio portfolio = Portfolio(
     personalInfo: PersonalInfo(
       name: "Ahmad Asghar",
       profession: "Full Stack Developer",
       profileImage: "https://vjkzigqgootdjxrwreya.supabase.co/storage/v1/object/sign/users/Untitled%20folder/mazen_elgamal_preview_rev_1-removebg-preview.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJ1c2Vycy9VbnRpdGxlZCBmb2xkZXIvbWF6ZW5fZWxnYW1hbF9wcmV2aWV3X3Jldl8xLXJlbW92ZWJnLXByZXZpZXcucG5nIiwiaWF0IjoxNzQyNzk5NjU0LCJleHAiOjE3NzQzMzU2NTR9.4Zmq7LXXCD36lp-NKjupngZDZyDjpK9eG3xnFFfn8xM",
       description: "Passionate developer with 5+ years of experience in building scalable web applications. "
           "Specialized in modern JavaScript frameworks and cloud technologies. "
           "Open source contributor and tech community enthusiast.",
     ),
     contactInfo: [
       ContactInfo(
         id: "1",
         name: "Email",
         logoUrl: "https://cdn-icons-png.flaticon.com/512/732/732200.png",
         linkOrPhone: "ahmad.asghar@example.com",
       ),
       ContactInfo(
         id: "2",
         name: "LinkedIn",
         logoUrl: "https://cdn-icons-png.flaticon.com/512/174/174857.png",
         linkOrPhone: "https://linkedin.com/in/ahmadasghar",
       ),
       ContactInfo(
         id: "3",
         name: "GitHub",
         logoUrl: "https://cdn-icons-png.flaticon.com/512/25/25231.png",
         linkOrPhone: "https://github.com/ahmadasghar",
       ),
     ],
     experience: [
       Experience(
         id: "exp1",
         companyName: "Tech Solutions Inc.",
         logoUrl: "https://vjkzigqgootdjxrwreya.supabase.co/storage/v1/object/sign/users/Untitled%20folder/mazen_elgamal_preview_rev_1-removebg-preview.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJ1c2Vycy9VbnRpdGxlZCBmb2xkZXIvbWF6ZW5fZWxnYW1hbF9wcmV2aWV3X3Jldl8xLXJlbW92ZWJnLXByZXZpZXcucG5nIiwiaWF0IjoxNzQyNzk5NjU0LCJleHAiOjE3NzQzMzU2NTR9.4Zmq7LXXCD36lp-NKjupngZDZyDjpK9eG3xnFFfn8xM",
         role: "Senior Software Engineer",
         description: "Led development of enterprise-level SaaS applications using React and Node.js. "
             "Implemented CI/CD pipelines and microservices architecture.",
         startDate: DateTime(2020, 3),
         endDate: DateTime.now(),
       ),
       Experience(
         id: "exp2",
         companyName: "Digital Innovations Ltd.",
         logoUrl: "https://vjkzigqgootdjxrwreya.supabase.co/storage/v1/object/sign/users/Untitled%20folder/mazen_elgamal_preview_rev_1-removebg-preview.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJ1c2Vycy9VbnRpdGxlZCBmb2xkZXIvbWF6ZW5fZWxnYW1hbF9wcmV2aWV3X3Jldl8xLXJlbW92ZWJnLXByZXZpZXcucG5nIiwiaWF0IjoxNzQyNzk5NjU0LCJleHAiOjE3NzQzMzU2NTR9.4Zmq7LXXCD36lp-NKjupngZDZyDjpK9eG3xnFFfn8xM",
         role: "Full Stack Developer",
         description: "Developed and maintained e-commerce platforms handling 50k+ monthly users. "
             "Integrated payment gateways and optimized database performance.",
         startDate: DateTime(2018, 1),
         endDate: DateTime(2020, 2),
       ),
     ],
     projects: [
       Project(
         id: "proj1",
         name: "E-Commerce Platform",
         description: "A full-featured online shopping platform with real-time inventory management "
             "and payment processing capabilities.",
         technologies: ["React", "Node.js", "MongoDB", "Redis", "Stripe API"],
         links: [
           "https://github.com/ahmadasghar/ecommerce",
           "https://ecommerce.demo.com"
         ],
         images: [
           "https://vjkzigqgootdjxrwreya.supabase.co/storage/v1/object/sign/users/Untitled%20folder/mazen_elgamal_preview_rev_1-removebg-preview.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJ1c2Vycy9VbnRpdGxlZCBmb2xkZXIvbWF6ZW5fZWxnYW1hbF9wcmV2aWV3X3Jldl8xLXJlbW92ZWJnLXByZXZpZXcucG5nIiwiaWF0IjoxNzQyNzk5NjU0LCJleHAiOjE3NzQzMzU2NTR9.4Zmq7LXXCD36lp-NKjupngZDZyDjpK9eG3xnFFfn8xM",
         ],
       ),
       Project(
         id: "proj2",
         name: "Task Management App",
         description: "Collaborative project management tool with real-time updates "
             "and team communication features.",
         technologies: ["Flutter", "Firebase", "Provider", "Dart", "Firestore"],
         links: [
           "https://github.com/ahmadasghar/task-manager",
           "https://taskmanager.demo.com"
         ],
         images: [
           "https://vjkzigqgootdjxrwreya.supabase.co/storage/v1/object/sign/users/Untitled%20folder/mazen_elgamal_preview_rev_1-removebg-preview.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJ1c2Vycy9VbnRpdGxlZCBmb2xkZXIvbWF6ZW5fZWxnYW1hbF9wcmV2aWV3X3Jldl8xLXJlbW92ZWJnLXByZXZpZXcucG5nIiwiaWF0IjoxNzQyNzk5NjU0LCJleHAiOjE3NzQzMzU2NTR9.4Zmq7LXXCD36lp-NKjupngZDZyDjpK9eG3xnFFfn8xM",
         ],
       ),
     ],
   );

   static void initSl (){
     sl.registerLazySingleton<SettingsBloc>(()=>SettingsBloc(sl(),sl(),sl()));
     sl.registerLazySingleton<SettingsRepository>(()=>SettingsRepository());
     sl.registerLazySingleton<GetCurrentSettingsUseCase>(()=>GetCurrentSettingsUseCase(sl()));
     sl.registerLazySingleton<UpdateLanguageUseCase>(()=>UpdateLanguageUseCase(sl()));
     sl.registerLazySingleton<UpdateThemeUseCase>(()=>UpdateThemeUseCase(sl()));


     sl.registerLazySingleton<AuthBloc>(()=>AuthBloc(sl(),sl(),sl()));
     sl.registerLazySingleton<BaseUserDataSource>(()=>UserDataSource(SupabaseAuthService()));
     sl.registerLazySingleton<BaseUserRepository>(()=>UserRepository(sl()));
     sl.registerLazySingleton<RegisterByEmailUseCase>(()=>RegisterByEmailUseCase(sl()));
     sl.registerLazySingleton<LoginByEmailUseCase>(()=>LoginByEmailUseCase(sl()));
     sl.registerLazySingleton<LogoutUseCase>(()=>LogoutUseCase(sl()));


     // Bloc
     sl.registerFactory<PortfolioBloc>(() => PortfolioBloc(sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl()));
     // Data Source
     sl.registerLazySingleton<BaseDataSource>(() => SupabaseDataSource());
     // Repository
     sl.registerLazySingleton<BasePortfolioRepository>(() => PortfolioRepository(sl()));
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