import 'package:flutter/material.dart';

import '../../../core/theme/color_manager.dart';
class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 100),
          color: AppColors.primary,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hi, my name is'),
                    const SizedBox(height: 20),
                    Text('Ahmad Asghar.'),
                    Text('I build things for the web.'),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.8,
                      child: Text(
                        'I\'m a software developer specializing in building exceptional digital experiences. Currently focused on building accessible, human-centered products.',

                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        foregroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      ),
                      onPressed: () {},
                      child: const Text('Check out my work'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
