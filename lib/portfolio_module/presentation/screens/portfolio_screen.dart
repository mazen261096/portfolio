import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/portfolio_module/presentation/screens/about_me_widget.dart';
import 'package:portfolio/portfolio_module/presentation/screens/experience_widget.dart';
import 'package:portfolio/portfolio_module/presentation/screens/header_widget.dart';
import 'package:portfolio/portfolio_module/presentation/screens/projects_widget.dart';

import '../../../core/services/service_locator.dart';
import '../controller/portfolio_bloc.dart';
import '../controller/portfolio_states.dart';
import 'app_bar_widget.dart';


class PortfolioScreen extends StatelessWidget {
  final String userName;
  const PortfolioScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PortfolioBloc>(),
      child: PortfolioView(),
    );
  }
}

class PortfolioView extends StatelessWidget {
  PortfolioView({super.key});

  final GlobalKey aboutMeKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final portfolioBloc = context.read<PortfolioBloc>();

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: portfolioBloc.scrollController,
            child: Column(
              children: [
               // const HeaderWidget(),
                AboutMeWidget(key: aboutMeKey,),
                ProjectsWidget(key: projectsKey),
                ExperienceWidget(key: experienceKey,),

              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: BlocBuilder<PortfolioBloc, PortfolioState>(
              buildWhen: (oldState,newState)=> oldState.appBarOpacity != newState.appBarOpacity,
              builder: (context, state) {
                return AppBarWidget(
                  aboutMeKey: aboutMeKey,
                  projectsKey: projectsKey,
                  experienceKey: experienceKey,
                  opacity: state.appBarOpacity,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
