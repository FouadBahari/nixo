import 'package:flutter/material.dart';
import 'package:nixo/config/routes/app_routes.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/features/tasks/presentation/widgets/box_task_widget.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  Widget _buildTasksBody() {
    return GridView.count(
        padding: EdgeInsets.fromLTRB(
            AppMargin.m24, AppMargin.m20, AppMargin.m24, AppMargin.m8),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          BoxTask(
            icon: Icons.favorite,
            title: 'Eisenhower \nMatrix',
            onpressed: () {
              Navigator.pushNamed(context, AppRoutes.eisenhower);
            },
          ),
          BoxTask(
            icon: Icons.face_outlined,
            title: 'Habit \nTracker',
            onpressed: () {},
          ),
          BoxTask(
            icon: Icons.transgender_outlined,
            title: 'Goals',
            onpressed: () {},
          ),
          BoxTask(
            icon: Icons.add,
            title: "Add Group",
            backboxColor: AppColors.boxColor2.withOpacity(0.12),
            onpressed: () {},
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.system, child: _buildTasksBody());
  }
}
