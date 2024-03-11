import 'package:blog_app/core/theme/app_pallette.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppPallete.gradient2,
      ),
    );
  }
}
