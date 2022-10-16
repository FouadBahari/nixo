import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_styles.dart';

class GoalsBox extends StatelessWidget {
  final Color boxColor;
  final String title;
  final String subTitle;

  GoalsBox(
      {super.key,
      required this.boxColor,
      required this.title,
      required this.subTitle});
  CountDownController _countDownController = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: AppSize.height110,
      width: double.infinity,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(AppSize.radius20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircularCountDownTimer(
            duration: 10,
            initialDuration: 0,
            controller: _countDownController,
            width: AppSize.width80,
            height: AppSize.height80,
            ringColor: AppColors.primary,
            ringGradient: LinearGradient(
              colors: [AppColors.primary, AppColors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            fillColor: AppColors.system,
            backgroundColor: AppColors.system,
            strokeWidth: AppSize.width5,
            strokeCap: StrokeCap.round,
            textStyle: getSemiBoldStyle(
              color: AppColors.white,
              fontSize: AppSize.font30,
            ),
            textFormat: CountdownTextFormat.S,
            isReverse: false,
            isReverseAnimation: false,
            isTimerTextShown: true,
            autoStart: false,
            onStart: () {
              debugPrint('Countdown Started');
            },
            onComplete: () {
              debugPrint('Countdown Ended');
            },
            onChange: (String timeStamp) {
              debugPrint('Countdown Changed $timeStamp');
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: getSemiBoldStyle(
                  color: AppColors.white,
                  fontSize: AppSize.font14,
                ),
              ),
              Text(
                subTitle,
                style: getRegularStyle(
                  color: AppColors.white,
                  fontSize: AppSize.font10,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: AppSize.height20,
                    width: AppSize.width180,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(AppSize.radius10)),
                      child: LinearProgressIndicator(
                        value: 0.5,
                        color: AppColors.system,
                        backgroundColor: AppColors.appBarIConColor,
                        minHeight: AppSize.font15,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppSize.width10,
                  ),
                  Text(
                    '% 50',
                    style: getMediumStyle(
                        color: AppColors.system, fontSize: AppSize.font17),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
