import 'package:flutter/material.dart';
class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      child: Center(
        child: Text('Projects', style: const TextStyle(fontSize: 30, color: Colors.white)),
      ),
    );
  }
}
