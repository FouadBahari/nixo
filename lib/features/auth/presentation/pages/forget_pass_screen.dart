import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nixo/config/routes/app_routes.dart';
import 'package:nixo/core/utils/app_assets.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_strings.dart';
import 'package:nixo/core/utils/app_styles.dart';
import 'package:nixo/core/widgets/primary_btn.dart';
import 'package:nixo/core/widgets/text_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  Widget _buildingForgetPasswordBody() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.authbackground),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(
            top: AppMargin.m50, left: AppMargin.m24, right: AppMargin.m24),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.white,
                    size: AppSize.height22,
                  ),
                  SizedBox(
                    width: AppSize.width2,
                  ),
                  Text(
                    AppStrings.back,
                    style: getRegularStyle(
                        color: AppColors.white, fontSize: AppFontSize.font17),
                  )
                ],
              ),
            ),
            SizedBox(
              height: AppSize.height10,
            ),
            Text(
              AppStrings.resetpassword,
              style: getSemiBoldStyle(
                color: AppColors.white,
                fontSize: AppFontSize.font19,
              ),
            ),
            SizedBox(
              height: AppSize.height30,
            ),
            Text(
              AppStrings.ressetpasswordtext,
              textAlign: TextAlign.center,
              style: getBoldStyle(
                color: AppColors.white,
                fontSize: AppFontSize.font21,
              ),
            ),
            SizedBox(
              height: AppSize.height100,
            ),
            CustomTextField(title: AppStrings.email),
            SizedBox(
              height: AppSize.height50,
            ),
            SizedBox(
              height: AppSize.height50,
              width: double.infinity,
              child: PrimaryButtom(onPressed: () {}, title: AppStrings.reset),
            ),
            SizedBox(
              height: AppSize.height20,
            ),
            RichText(
              text: TextSpan(
                  text: AppStrings.youdonthave,
                  style: getMediumStyle(
                    color: AppColors.white,
                    fontSize: AppFontSize.font17,
                  ),
                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.registerRoute);
                          },
                        text: AppStrings.signup,
                        style: getMediumStyle(
                          color: AppColors.primary,
                          fontSize: AppFontSize.font17,
                        ))
                  ]),
            ),
            SizedBox(
              height: AppSize.height40,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.system,
      body: _buildingForgetPasswordBody(),
    );
  }
}
