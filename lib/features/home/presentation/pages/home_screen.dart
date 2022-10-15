import 'package:flutter/material.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_strings.dart';
import 'package:nixo/core/utils/app_styles.dart';
import 'package:nixo/core/widgets/listtile.dart';
import 'package:nixo/core/widgets/primary_btn.dart';
import 'package:nixo/features/home/presentation/widgets/analyticsWidget.dart';
import 'package:nixo/features/home/presentation/widgets/overview_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isClicked = true;
  bool _isLast = false;

  _click(bool value) {
    setState(() {
      _isClicked = value;
    });
  }

  _buildTabButtons() {
    return Row(
      children: [
        _isClicked
            ? PrimaryButtom(onPressed: () {}, title: AppStrings.overview)
            : TextButton(
                onPressed: () => _click(true),
                child: Text(
                  AppStrings.overview,
                  style: getRegularStyle(color: AppColors.primary),
                )),
        SizedBox(width: AppSize.width30),
        !_isClicked
            ? PrimaryButtom(onPressed: () {}, title: AppStrings.productivity)
            : TextButton(
                onPressed: () => _click(false),
                child: Text(
                  AppStrings.productivity,
                  style: getRegularStyle(color: AppColors.primary),
                )),
      ],
    );
  }

  _buildOverviewContent() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (_, index) {
        if (index == 0) {
          return Column(
            children: [
              const OverviewCard(),
              SizedBox(
                height: AppSize.height10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.date,
                    style: getSemiBoldStyle(color: AppColors.white),
                  ),
                  Text(
                    AppStrings.seeAll,
                    style: getSemiBoldStyle(color: AppColors.primary),
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.height20,
              ),
            ],
          );
        }
        return ToDoItemWidget(
            name: "Quraan Reading",
            catName: 'Work',
            hour: '12:20 AM',
            isChecked: true,
            timing: '13 min');
      },
      childCount: 10,
    ));
  }

  _buildProductivityContent() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (_, index) {
        return AnalyticsWidget();
      },
      childCount: 10,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.system,
      padding: EdgeInsets.only(
          top: AppSize.p24, left: AppSize.p24, right: AppSize.p24),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.system,
            expandedHeight: AppSize.height220,
            collapsedHeight: AppSize.height200,
            flexibleSpace: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${AppStrings.hello}\nSeifou',
                  style: getSemiBoldStyle(
                      color: AppColors.white, fontSize: AppSize.font46),
                ),
                SizedBox(height: AppSize.height20),
                _buildTabButtons(),
              ],
            ),
          ),
          _isClicked ? _buildOverviewContent() : _buildProductivityContent(),
        ],
      ),
    );
  }
}
