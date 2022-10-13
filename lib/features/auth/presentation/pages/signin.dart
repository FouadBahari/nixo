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

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  Widget _buildSignInBody() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.authbackground),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(
            top: AppSize.m50, left: AppSize.m24, right: AppSize.m24),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, AppRoutes.registerRoute);
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
                        color: AppColors.white, fontSize: AppSize.font17),
                  )
                ],
              ),
            ),
            SizedBox(
              height: AppSize.height10,
            ),
            Text(
              AppStrings.login,
              style: getSemiBoldStyle(
                color: AppColors.white,
                fontSize: AppSize.font19,
              ),
            ),
            SizedBox(
              height: AppSize.height30,
            ),
            Text(
              AppStrings.signintext,
              textAlign: TextAlign.center,
              style: getBoldStyle(
                color: AppColors.white,
                fontSize: AppSize.font21,
              ),
            ),
            SizedBox(
              height: AppSize.height100,
            ),
            CustomTextField(title: AppStrings.email),
            SizedBox(height: AppSize.height15),
            CustomTextField(
              title: AppStrings.password,
              obscureText: true,
            ),
            SizedBox(
              height: AppSize.height10,
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.forgotPasswordRoute);
                },
                child: Text(
                  AppStrings.forgetpassword,
                  style: getMediumStyle(
                      color: AppColors.primary, fontSize: AppSize.font17),
                ),
              ),
            ),
            SizedBox(
              height: AppSize.height80,
            ),
            SizedBox(
              height: AppSize.height50,
              width: double.infinity,
              child: PrimaryButtom(onPressed: () {}, title: AppStrings.login),
            ),
            SizedBox(
              height: AppSize.height20,
            ),
            Text(
              AppStrings.or,
              style: getMediumStyle(
                  color: AppColors.white, fontSize: AppSize.font17),
            ),
            SizedBox(
              height: AppSize.height20,
            ),
            RichText(
              text: TextSpan(
                  text: AppStrings.youdonthave,
                  style: getMediumStyle(
                    color: AppColors.white,
                    fontSize: AppSize.font17,
                  ),
                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                                context, AppRoutes.registerRoute);
                          },
                        text: AppStrings.signup,
                        style: getMediumStyle(
                          color: AppColors.primary,
                          fontSize: AppSize.font17,
                        ))
                  ]),
            ),
            SizedBox(
              height: AppSize.height40,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.fbcolor,
                        fixedSize: Size(AppSize.width10, AppSize.height50)),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.mainRoute);
                    },
                    child: Image.asset(AssetsManager.facebook),
                  ),
                ),
                SizedBox(
                  width: AppSize.width15,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        fixedSize: Size(AppSize.width10, AppSize.height50)),
                    onPressed: () {},
                    child: Image.asset(AssetsManager.google),
                  ),
                ),
              ],
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
      body: _buildSignInBody(),
    );
  }
}
