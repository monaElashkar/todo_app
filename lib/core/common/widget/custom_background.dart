import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;
  const CustomBackground({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
            AppColors.backgroundColorStart,
            AppColors.backgroundColorEnd,
          ])
        ),
        child: child,
        );
  }
}