import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/portfolio_module/domain/usecases/ContactInfo/add_contact_info_useCase.dart';
import 'package:portfolio/portfolio_module/domain/usecases/ContactInfo/delete_contact_info_useCase.dart';
import 'package:portfolio/portfolio_module/domain/usecases/PersonalInfo/get_portfolio_data_useCase.dart';
import 'package:portfolio/portfolio_module/domain/usecases/Project/update_project_useCase.dart';
import '../../../core/utils/enums.dart';
import '../../domain/usecases/ContactInfo/update_contact_info_useCase.dart';
import '../../domain/usecases/Experience/add_experience_useCase.dart';
import '../../domain/usecases/Experience/delete_experience_useCase.dart';
import '../../domain/usecases/Experience/update_experience_useCase.dart';
import '../../domain/usecases/PersonalInfo/add_personal_info_useCase.dart';
import '../../domain/usecases/PersonalInfo/delete_personal_info_useCase.dart';
import '../../domain/usecases/PersonalInfo/update_personal_info_useCase.dart';
import '../../domain/usecases/Project/add_project_useCase.dart';
import '../../domain/usecases/Project/delete_project_useCase.dart';
import 'portfolio_events.dart';
import 'portfolio_states.dart';
import '../../domain/repository/portfolio_repository.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {

  final AddContactInfoUseCase addContactInfoUseCase;
  final UpdateContactInfoUseCase updateContactInfoUseCase;
  final DeleteContactInfoUseCase deleteContactInfoUseCase;

  final AddExperienceUseCase addExperienceUseCase;
  final UpdateExperienceUseCase updateExperienceUseCase;
  final DeleteExperienceUseCase deleteExperienceUseCase;

  final AddPersonalInfoUseCase addPersonalInfoUseCase;
  final UpdatePersonalInfoUseCase updatePersonalInfoUseCase;
  final DeletePersonalInfoUseCase deletePersonalInfoUseCase;

  final AddProjectUseCase addProjectUseCase;
  final UpdateProjectUseCase updateProjectUseCase;
  final DeleteProjectUseCase deleteProjectUseCase;

  final GetPortfolioDataUseCase getPortfolioDataUseCase;

  PortfolioBloc(
      this.deleteContactInfoUseCase,
      this.getPortfolioDataUseCase,
      this.updateProjectUseCase,
      this.addContactInfoUseCase,
      this.addExperienceUseCase,
      this.addPersonalInfoUseCase,
      this.addProjectUseCase,
      this.deleteExperienceUseCase,
      this.deletePersonalInfoUseCase,
      this.deleteProjectUseCase,
      this.updateContactInfoUseCase,
      this.updateExperienceUseCase,
      this.updatePersonalInfoUseCase,
      ) : super(const PortfolioState()) {
    on<LoadPortfolioData>(_onLoadPortfolioData);
    on<AddPersonalInfo>(_onAddPersonalInfo);
    on<UpdatePersonalInfo>(_onUpdatePersonalInfo);
    on<DeletePersonalInfo>(_onDeletePersonalInfo);
    on<AddContactInfo>(_onAddContactInfo);
    on<UpdateContactInfo>(_onUpdateContactInfo);
    on<DeleteContactInfo>(_onDeleteContactInfo);
    on<AddExperience>(_onAddExperience);
    on<UpdateExperience>(_onUpdateExperience);
    on<DeleteExperience>(_onDeleteExperience);
    on<AddProject>(_onAddProject);
    on<UpdateProject>(_onUpdateProject);
    on<DeleteProject>(_onDeleteProject);
  }

  Future<void> _onLoadPortfolioData(LoadPortfolioData event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(portfolioRequestState: RequestState.loading));
    final result = await getPortfolioDataUseCase.execute();
    result.fold(
          (l) => emit(state.copyWith(portfolioRequestState: RequestState.error, portfolioMessage: l.message)),
          (r) => emit(state.copyWith(portfolio: r, portfolioRequestState: RequestState.loaded)),
    );
  }

  Future<void> _onAddPersonalInfo(AddPersonalInfo event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(personalInfoRequestState: RequestState.loading));
    final result = await addPersonalInfoUseCase.execute(event.personalInfo);
    result.fold(
          (l) => emit(state.copyWith(personalInfoRequestState: RequestState.error, personalInfoMessage: l.message)),
          (_) => emit(state.copyWith(personalInfoRequestState: RequestState.loaded)),
    );
  }

  Future<void> _onUpdatePersonalInfo(UpdatePersonalInfo event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(personalInfoRequestState: RequestState.loading));
    final result = await updatePersonalInfoUseCase.execute(event.personalInfo);
    result.fold(
          (l) => emit(state.copyWith(personalInfoRequestState: RequestState.error, personalInfoMessage: l.message)),
          (_) => emit(state.copyWith(personalInfoRequestState: RequestState.loaded)),
    );
  }

  Future<void> _onDeletePersonalInfo(DeletePersonalInfo event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(personalInfoRequestState: RequestState.loading));
    final result = await deletePersonalInfoUseCase.execute(event.id);
    result.fold(
          (l) => emit(state.copyWith(personalInfoRequestState: RequestState.error, personalInfoMessage: l.message)),
          (_) => emit(state.copyWith(personalInfoRequestState: RequestState.loaded)),
    );
  }

  Future<void> _onAddContactInfo(AddContactInfo event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(contactInfoRequestState: RequestState.loading));
    final result = await addContactInfoUseCase.execute(event.contactInfo);
    result.fold(
          (l) => emit(state.copyWith(contactInfoRequestState: RequestState.error, contactInfoMessage: l.message)),
          (_) => emit(state.copyWith(contactInfoRequestState: RequestState.loaded)),
    );
  }

  Future<void> _onUpdateContactInfo(UpdateContactInfo event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(contactInfoRequestState: RequestState.loading));
    final result = await updateContactInfoUseCase.execute(event.contactInfo);
    result.fold(
          (l) => emit(state.copyWith(contactInfoRequestState: RequestState.error, contactInfoMessage: l.message)),
          (_) => emit(state.copyWith(contactInfoRequestState: RequestState.loaded)),
    );
  }

  Future<void> _onDeleteContactInfo(DeleteContactInfo event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(contactInfoRequestState: RequestState.loading));
    final result = await deleteContactInfoUseCase.execute(event.contactId);
    result.fold(
          (l) => emit(state.copyWith(contactInfoRequestState: RequestState.error, contactInfoMessage: l.message)),
          (_) => emit(state.copyWith(contactInfoRequestState: RequestState.loaded)),
    );
  }

  Future<void> _onAddExperience(AddExperience event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(experienceRequestState: RequestState.loading));
    final result = await addExperienceUseCase.execute(event.experience);
    result.fold(
          (l) => emit(state.copyWith(experienceRequestState: RequestState.error, experienceMessage: l.message)),
          (_) => emit(state.copyWith(experienceRequestState: RequestState.loaded)),
    );
  }

  Future<void> _onUpdateExperience(UpdateExperience event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(experienceRequestState: RequestState.loading));
    final result = await updateExperienceUseCase.execute(event.experience);
    result.fold(
          (l) => emit(state.copyWith(experienceRequestState: RequestState.error, experienceMessage: l.message)),
          (_) => emit(state.copyWith(experienceRequestState: RequestState.loaded)),
    );
  }

  Future<void> _onDeleteExperience(DeleteExperience event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(experienceRequestState: RequestState.loading));
    final result = await deleteExperienceUseCase.execute(event.experienceId);
    result.fold(
          (l) => emit(state.copyWith(experienceRequestState: RequestState.error, experienceMessage: l.message)),
          (_) => emit(state.copyWith(experienceRequestState: RequestState.loaded)),
    );
  }

  Future<void> _onAddProject(AddProject event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(projectRequestState: RequestState.loading));
    final result = await addProjectUseCase.execute(event.project);
    result.fold(
          (l) => emit(state.copyWith(projectRequestState: RequestState.error, projectMessage: l.message)),
          (_) => emit(state.copyWith(projectRequestState: RequestState.loaded)),
    );
  }

  Future<void> _onUpdateProject(UpdateProject event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(projectRequestState: RequestState.loading));
    final result = await updateProjectUseCase.execute(event.project);
    result.fold(
          (l) => emit(state.copyWith(projectRequestState: RequestState.error, projectMessage: l.message)),
          (_) => emit(state.copyWith(projectRequestState: RequestState.loaded)),
    );
  }

  Future<void> _onDeleteProject(DeleteProject event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(projectRequestState: RequestState.loading));
    final result = await deleteProjectUseCase.execute(event.projectId);
    result.fold(
          (l) => emit(state.copyWith(projectRequestState: RequestState.error, projectMessage: l.message)),
          (_) => emit(state.copyWith(projectRequestState: RequestState.loaded)),
    );
  }
}
