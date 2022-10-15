import 'package:flutter/material.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_strings.dart';
import 'package:nixo/core/utils/app_styles.dart';
import 'package:nixo/core/widgets/app_bar.dart';

class EisnhowerMatrixScreen extends StatefulWidget {
  const EisnhowerMatrixScreen({super.key});

  @override
  State<EisnhowerMatrixScreen> createState() => _EisnhowerMatrixScreenState();
}

class _EisnhowerMatrixScreenState extends State<EisnhowerMatrixScreen> {
  Widget _buildEisnhowerBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSize.p24),
      child: Column(
        children: [
          Center(
            child: Text(
              textAlign: TextAlign.center,
              AppStrings.eisenhowerMatrix,
              style: getSemiBoldStyle(
                  color: AppColors.white, fontSize: AppSize.font14),
            ),
          ),
          SizedBox(
            height: AppSize.height18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: AppSize.height320,
                width: AppSize.width160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.radius20),
                    color: AppColors.redBox.withOpacity(0.7)),
                child: Column(
                  children: [
                    SizedBox(
                      height: AppSize.height18,
                    ),
                    Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        AppStrings.urgentmportant,
                        style: getSemiBoldStyle(
                          color: AppColors.white,
                          fontSize: AppSize.font14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: AppSize.height320,
                width: AppSize.width160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.radius20),
                    color: AppColors.orangeBox.withOpacity(0.7)),
                child: Column(
                  children: [
                    SizedBox(
                      height: AppSize.height18,
                    ),
                    Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        AppStrings.noturgentimportant,
                        style: getSemiBoldStyle(
                          color: AppColors.white,
                          fontSize: AppSize.font14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppSize.height18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: AppSize.height320,
                width: AppSize.width160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.radius20),
                    color: AppColors.primary.withOpacity(0.7)),
                child: Column(
                  children: [
                    SizedBox(
                      height: AppSize.height18,
                    ),
                    Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        AppStrings.urgentunimportant,
                        style: getSemiBoldStyle(
                          color: AppColors.white,
                          fontSize: AppSize.font14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: AppSize.height320,
                width: AppSize.width160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.radius20),
                    color: AppColors.success.withOpacity(0.7)),
                child: Column(
                  children: [
                    SizedBox(
                      height: AppSize.height18,
                    ),
                    Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        AppStrings.noturgentunimportant,
                        style: getSemiBoldStyle(
                          color: AppColors.white,
                          fontSize: AppSize.font14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
      body: Container(
        color: AppColors.system,
        child: _buildEisnhowerBody(),
      ),
    );
  }
}
