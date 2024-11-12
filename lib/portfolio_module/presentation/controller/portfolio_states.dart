import 'package:equatable/equatable.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/portfolio.dart';

class PortfolioState extends Equatable {
  final Portfolio? portfolio;
  final RequestState portfolioRequestState;
  final String portfolioMessage;

  final RequestState personalInfoRequestState;
  final String personalInfoMessage;

  final RequestState contactInfoRequestState;
  final String contactInfoMessage;

  final RequestState experienceRequestState;
  final String experienceMessage;

  final RequestState projectRequestState;
  final String projectMessage;

  const PortfolioState({
    this.portfolio,
    this.portfolioRequestState = RequestState.loading,
    this.portfolioMessage = '',
    this.personalInfoRequestState = RequestState.loading,
    this.personalInfoMessage = '',
    this.contactInfoRequestState = RequestState.loading,
    this.contactInfoMessage = '',
    this.experienceRequestState = RequestState.loading,
    this.experienceMessage = '',
    this.projectRequestState = RequestState.loading,
    this.projectMessage = '',
  });

  PortfolioState copyWith({
    Portfolio? portfolio,
    RequestState? portfolioRequestState,
    String? portfolioMessage,
    RequestState? personalInfoRequestState,
    String? personalInfoMessage,
    RequestState? contactInfoRequestState,
    String? contactInfoMessage,
    RequestState? experienceRequestState,
    String? experienceMessage,
    RequestState? projectRequestState,
    String? projectMessage,
  }) {
    return PortfolioState(
      portfolio: portfolio ?? this.portfolio,
      portfolioRequestState: portfolioRequestState ?? this.portfolioRequestState,
      portfolioMessage: portfolioMessage ?? this.portfolioMessage,
      personalInfoRequestState: personalInfoRequestState ?? this.personalInfoRequestState,
      personalInfoMessage: personalInfoMessage ?? this.personalInfoMessage,
      contactInfoRequestState: contactInfoRequestState ?? this.contactInfoRequestState,
      contactInfoMessage: contactInfoMessage ?? this.contactInfoMessage,
      experienceRequestState: experienceRequestState ?? this.experienceRequestState,
      experienceMessage: experienceMessage ?? this.experienceMessage,
      projectRequestState: projectRequestState ?? this.projectRequestState,
      projectMessage: projectMessage ?? this.projectMessage,
    );
  }

  @override
  List<Object?> get props => [
    portfolio,
    portfolioRequestState,
    portfolioMessage,
    personalInfoRequestState,
    personalInfoMessage,
    contactInfoRequestState,
    contactInfoMessage,
    experienceRequestState,
    experienceMessage,
    projectRequestState,
    projectMessage,
  ];
}
