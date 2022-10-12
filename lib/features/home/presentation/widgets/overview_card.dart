import 'package:flutter/material.dart';
import 'package:nixo/core/utils/app_assets.dart';
import 'package:nixo/core/utils/app_dimensions.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.radius20)),
            image: DecorationImage(
                image: AssetImage(AssetsManager.overviewCard),
                fit: BoxFit.cover)),
        child: Text('hello'),
      ),
    );
  }
}
