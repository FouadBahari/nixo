import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_strings.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_styles.dart';
import 'package:nixo/core/widgets/app_bar.dart';
import 'package:nixo/core/widgets/listtile.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  Widget _buildGroupBody() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.p24,
      ),
      child: Column(
        children: [
          Center(
            child: Text(
              textAlign: TextAlign.center,
              'Work',
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
                ToDoItemWidget(
                    name: 'Design',
                    catName: 'life',
                    hour: '22:20 AM',
                    isChecked: true,
                    timing: '20min')
              ],
            ),
          )
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
        body: Container(child: _buildGroupBody()));
  }
}
