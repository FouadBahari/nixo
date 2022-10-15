import 'package:flutter/material.dart';
import 'package:nixo/config/routes/app_routes.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/widgets/custom_add.dart';
import 'package:nixo/features/tasks/presentation/widgets/box_task_widget.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  Widget _buildTasksBody() {
    return GridView.count(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: EdgeInsets.fromLTRB(
            AppSize.m24, AppSize.m20, AppSize.m24, AppSize.m8),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          BoxTask(
            icon: Icons.favorite,
            title: 'Eisenhower \nMatrix',
            onpressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed(AppRoutes.eisenhower);
            },
          ),
          BoxTask(
            icon: Icons.face_outlined,
            title: 'Habit \nTracker',
            onpressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed(AppRoutes.habitTracker);
            },
          ),
          BoxTask(
            icon: Icons.transgender_outlined,
            title: 'Goals',
            onpressed: () {},
          ),
          CustomAddButton(
            height: AppSize.height150,
            width: AppSize.width150,
            iconSize: AppSize.height50,
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.system, child: _buildTasksBody());
  }
}
