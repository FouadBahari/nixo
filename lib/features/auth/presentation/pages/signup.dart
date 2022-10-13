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

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  Widget _buildSignUpBody() {
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
                    context, AppRoutes.onBoardingRoute);
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
              AppStrings.signup,
              style: getSemiBoldStyle(
                color: AppColors.white,
                fontSize: AppSize.font19,
              ),
            ),
            SizedBox(
              height: AppSize.height30,
            ),
            Text(
              AppStrings.signuptext,
              textAlign: TextAlign.center,
              style: getBoldStyle(
                color: AppColors.white,
                fontSize: AppSize.font21,
              ),
            ),
            SizedBox(
              height: AppSize.height20,
            ),
            RichText(
              text: TextSpan(
                  text: AppStrings.alreadyHaveAcc,
                  style: getMediumStyle(
                    color: AppColors.white,
                    fontSize: AppSize.font17,
                  ),
                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, AppRoutes.loginRoute);
                          },
                        text: AppStrings.login,
                        style: getMediumStyle(
                          color: AppColors.primary,
                          fontSize: AppSize.font17,
                        ))
                  ]),
            ),
            SizedBox(
              height: AppSize.height50,
            ),
            CustomTextField(
              title: AppStrings.name,
            ),
            SizedBox(height: AppSize.height15),
            CustomTextField(
              title: AppStrings.email,
            ),
            SizedBox(height: AppSize.height15),
            CustomTextField(
              title: AppStrings.password,
              obscureText: true,
            ),
            SizedBox(height: AppSize.height80),
            SizedBox(
              height: AppSize.height50,
              width: double.infinity,
              child: PrimaryButtom(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.mainRoute);
                  },
                  title: AppStrings.conttinue),
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
                    onPressed: () {},
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
            SizedBox(
              height: AppSize.height50,
            ),
            RichText(
              text: TextSpan(
                  text: AppStrings.iagree,
                  style: getMediumStyle(
                    color: AppColors.white,
                    fontSize: AppSize.font14,
                  ),
                  children: [
                    TextSpan(
                        text: AppStrings.terms,
                        style: getMediumStyle(
                          color: AppColors.primary,
                          fontSize: AppSize.font14,
                        ))
                  ]),
            ),
            RichText(
              text: TextSpan(
                  text: AppStrings.seeour,
                  style: getMediumStyle(
                    color: AppColors.white,
                    fontSize: AppSize.font14,
                  ),
                  children: [
                    TextSpan(
                      text: AppStrings.privacypolicy,
                      style: getMediumStyle(
                        color: AppColors.primary,
                        fontSize: AppSize.font14,
                      ),
                    ),
                    TextSpan(
                      text: AppStrings.formore,
                      style: getMediumStyle(
                        color: AppColors.white,
                        fontSize: AppSize.font14,
                      ),
                    ),
                  ]),
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
      body: _buildSignUpBody(),
    );
  }
}
