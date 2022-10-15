import 'package:flutter/material.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/widgets/listtile.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(Duration(days: 2));
  }

  late DateTime _selectedDate;
  Widget _buildCalanderBody() {
    return Column(
      children: [
        Container(
          color: AppColors.transparent,
          child: CalendarTimeline(
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
        ),
        SizedBox(
          height: AppSize.height20,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
                top: AppSize.p24, left: AppSize.p24, right: AppSize.p24),
            child: ListView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              shrinkWrap: true,
              children: [
                ToDoItemWidget(
                    name: "Quraan Reading",
                    catName: 'Work',
                    hour: '12:20 AM',
                    isChecked: true,
                    timing: '13 min'),
                ToDoItemWidget(
                    name: "Buy Bread",
                    catName: 'Work',
                    hour: '12:20 AM',
                    isChecked: true,
                    timing: '13 min'),
                ToDoItemWidget(
                    name: "Create A Logo",
                    catName: 'Work',
                    hour: '12:20 AM',
                    isChecked: false,
                    timing: '13 min'),
                ToDoItemWidget(
                    name: "Go to gym",
                    catName: 'Work',
                    hour: '12:20 AM',
                    isChecked: true,
                    timing: '13 min'),
                ToDoItemWidget(
                    name: "Buy Bread",
                    catName: 'Work',
                    hour: '12:20 AM',
                    isChecked: true,
                    timing: '13 min'),
                ToDoItemWidget(
                    name: "Create A Logo",
                    catName: 'Work',
                    hour: '12:20 AM',
                    isChecked: false,
                    timing: '13 min'),
                ToDoItemWidget(
                    name: "Go to gym",
                    catName: 'Work',
                    hour: '12:20 AM',
                    isChecked: true,
                    timing: '13 min'),
                ToDoItemWidget(
                    name: "Buy Bread",
                    catName: 'Work',
                    hour: '12:20 AM',
                    isChecked: true,
                    timing: '13 min'),
                ToDoItemWidget(
                    name: "Create A Logo",
                    catName: 'Work',
                    hour: '12:20 AM',
                    isChecked: false,
                    timing: '13 min'),
                ToDoItemWidget(
                    name: "Go to gym",
                    catName: 'Work',
                    hour: '12:20 AM',
                    isChecked: true,
                    timing: '13 min'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.system, child: _buildCalanderBody());
  }
}
