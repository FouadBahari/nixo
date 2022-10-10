import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:nixo/config/routes/app_routes.dart';
import 'package:nixo/core/utils/app_assets.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_strings.dart';
import 'package:nixo/core/utils/app_styles.dart';
import 'package:nixo/core/widgets/primary_btn.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;
  Widget _buildImage(String imagePath) {
    return Center(
        child: Image.asset(
      imagePath,
    ));
  }

  PageDecoration _getPageDecoration() {
    return PageDecoration(
        imagePadding: EdgeInsets.only(top: AppSize.height60),
        pageColor: Colors.transparent,
        bodyTextStyle: getRegularStyle(
            color: AppColors.white, fontSize: AppFontSize.font16),
        titleTextStyle: getSemiBoldStyle(
            color: AppColors.white, fontSize: AppFontSize.font25),
        titlePadding: EdgeInsets.only(top: AppSize.height100),
        bodyPadding: EdgeInsets.only(top: AppSize.height40));
  }

  Widget _buildOnBoardingBody() {
    return Stack(
      children: [
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(AssetsManager.onboardbcgr)),
        _currentPage == 3
            ? Positioned(
                bottom: AppSize.height100,
                left: AppSize.width20,
                right: AppSize.width20,
                child: PrimaryButtom(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.mainRoute);
                  },
                  title: AppStrings.newHere,
                ))
            : const SizedBox(),
        _currentPage == 3
            ? Positioned(
                bottom: AppSize.height50,
                left: AppSize.width20,
                right: AppSize.width20,
                child: TextButton(
                  onPressed: () {},
                  child: Text(AppStrings.alreadyHaveAccount,
                      style: getSemiBoldStyle(
                        color: AppColors.primary,
                      )),
                ))
            : const SizedBox(),
        IntroductionScreen(
            globalBackgroundColor: Colors.transparent,
            isBottomSafeArea: true,
            pages: [
              PageViewModel(
                title: AppStrings.appName,
                body: AppStrings.onBoarding1Body,
                image: _buildImage(AssetsManager.onBoarding1),
                decoration: _getPageDecoration(),
              ),
              PageViewModel(
                title: AppStrings.onBoarding2Title,
                body: AppStrings.onBoarding2Body,
                image: _buildImage(AssetsManager.onBoarding2),
                decoration: _getPageDecoration(),
              ),
              PageViewModel(
                title: AppStrings.onBoarding3Title,
                body: AppStrings.onBoarding3Body,
                image: _buildImage(AssetsManager.onBoarding3),
                decoration: _getPageDecoration(),
              ),
              PageViewModel(
                title: AppStrings.onBoarding4Title,
                body: AppStrings.onBoarding4Body,
                image: _buildImage(AssetsManager.onBoarding4),
                decoration: _getPageDecoration(),
              ),
            ],
            showBackButton: false,
            showSkipButton: true,
            showNextButton: false,
            showDoneButton: true,
            onChange: ((value) {
              setState(() {
                _currentPage = value;
              });
            }),
            onDone: () {},
            skip: Text(
              AppStrings.skip,
              style: getBoldStyle(color: AppColors.primary),
            ),
            done: Text(
              AppStrings.done,
              style: getBoldStyle(color: AppColors.transparent),
            ),
            dotsDecorator: _buildDotsDecorator()),
      ],
    );
  }

  DotsDecorator _buildDotsDecorator() {
    return DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: AppSize.height2),
      activeColor: AppColors.primary,
      color: Colors.grey,
      activeSize: Size(AppSize.height18, AppSize.height8),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.radius25)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.system,
      body: _buildOnBoardingBody(),
    );
  }
}
