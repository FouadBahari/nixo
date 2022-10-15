import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';

class GoalsBox extends StatelessWidget {
  final Color boxColor;
  const GoalsBox({super.key, required this.boxColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(double.infinity, AppSize.height110),
            backgroundColor: boxColor),
        onPressed: () {},
        child: Row(
          children: [
            Center(
              child: Container(
                height: AppSize.height100,
                width: AppSize.width100,
                color: Colors.amber,
              ),
            ),
          ],
        ));
  }
}
