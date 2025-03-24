import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/portfolio_bloc.dart';
import '../controller/portfolio_events.dart';

class AppBarWidget extends StatelessWidget {
  final GlobalKey aboutMeKey;
  final GlobalKey projectsKey;
  final GlobalKey experienceKey;
  final double opacity;

  const AppBarWidget({
    super.key,
    required this.aboutMeKey,
    required this.projectsKey,
    required this.experienceKey,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(opacity),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAppBarButton("About Me", aboutMeKey, context),
            _buildAppBarButton("Projects", projectsKey, context),
            _buildAppBarButton("Experience", experienceKey, context),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBarButton(String title, GlobalKey key, BuildContext context) {
    return TextButton(
      onPressed: () => context.read<PortfolioBloc>().add(ScrollToSection(key)),
      child: Text(title, style: const TextStyle(color: Colors.black)),
    );
  }
}
