import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_strings.dart';
import 'package:nixo/core/utils/app_styles.dart';
import 'package:nixo/core/widgets/app_bar.dart';
import 'package:nixo/features/tasks/presentation/widgets/box_goals_widget.dart';

class GoalsTrackerScreen extends StatefulWidget {
  const GoalsTrackerScreen({super.key});

  @override
  State<GoalsTrackerScreen> createState() => _GoalsTrackerScreenState();
}

class _GoalsTrackerScreenState extends State<GoalsTrackerScreen> {
  Widget _buildGoalsBody() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.p24,
      ),
      child: Column(
        children: [
          Center(
            child: Text(
              textAlign: TextAlign.center,
              AppStrings.goals,
              style: getSemiBoldStyle(
                  color: AppColors.white, fontSize: AppSize.font17),
            ),
          ),
          SizedBox(
            height: AppSize.height24,
          ),
          Expanded(
            child: ListView(
              children: [
                GoalsBox(
                  subTitle: '2-days streak',
                  title: 'App design',
                  boxColor: AppColors.secondary.withOpacity(0.5),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.system,
        appBar: buildAppBar(() {
          Navigator.pop(context);
        }, Icons.arrow_back_outlined),
        body: Container(child: _buildGoalsBody()));
  }
}
