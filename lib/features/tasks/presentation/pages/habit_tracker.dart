import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:nixo/core/utils/app_strings.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_styles.dart';
import 'package:nixo/core/widgets/app_bar.dart';
import 'package:nixo/core/widgets/custom_add.dart';
import 'package:nixo/core/widgets/listtile.dart';

class HabitTrackerScreen extends StatefulWidget {
  const HabitTrackerScreen({super.key});

  @override
  State<HabitTrackerScreen> createState() => _HabitTrackerScreenState();
}

class _HabitTrackerScreenState extends State<HabitTrackerScreen> {
  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(Duration(days: 2));
  }

  late DateTime _selectedDate;
  Widget _buildHabitTrackerBody() {
    return Column(children: [
      Center(
        child: Text(
          textAlign: TextAlign.center,
          AppStrings.habitTracker,
          style: getSemiBoldStyle(
              color: AppColors.white, fontSize: AppSize.font17),
        ),
      ),
      SizedBox(
        height: AppSize.height20,
      ),
      CalendarTimeline(
        initialDate: DateTime.now(),
        firstDate: DateTime.utc(2022),
        lastDate: DateTime.now().add(Duration(days: 365 * 4)),
        onDateSelected: (date) => setState(
          () => _selectedDate = date,
        ),
        monthColor: AppColors.appBarIConColor,
        dayColor: AppColors.appBarIConColor,
        dayNameColor: AppColors.system,
        activeDayColor: AppColors.system,
        activeBackgroundDayColor: AppColors.primary,
        dotsColor: AppColors.white,
        selectableDayPredicate: (date) => date.day != 23,
      ),
      SizedBox(
        height: AppSize.height20,
      ),
      Expanded(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: AppSize.p24),
          children: [
            ToDoItemWidget(
                name: 'seif',
                catName: 'work',
                hour: '12:15',
                isChecked: true,
                timing: '12 min'),
            CustomAddButton(
              height: AppSize.height62,
              width: double.infinity,
              iconSize: AppSize.height25,
            )
          ],
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.system,
      appBar: buildAppBar(() {
        Navigator.pop(context);
      }, Icons.arrow_back_outlined),
      body: Container(
        color: AppColors.system,
        child: _buildHabitTrackerBody(),
      ),
    );
  }
}
