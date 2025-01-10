import 'package:flutter/material.dart';
import 'package:todo_app/core/common/widget/custom_background.dart';

import '../widgets/custom_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          CustomItem(
            title: 'title',
            subTitle: 'subTitle',
            value: true,
            onChanged: onChanged,
          ),
        ],
      ),
    ));
  }
  void Function(bool?)? onChanged(value) {}
}

