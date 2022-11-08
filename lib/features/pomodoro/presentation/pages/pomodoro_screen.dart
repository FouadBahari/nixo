import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_strings.dart';
import 'package:nixo/core/utils/app_styles.dart';
import 'package:nixo/core/widgets/primary_btn.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({super.key});

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  CountDownController _countDownController = CountDownController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  _buildPomodoroBody() {
    return Container(
      color: AppColors.system,
      padding: EdgeInsets.only(
          top: AppSize.p24, left: AppSize.p24, right: AppSize.p24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularCountDownTimer(
            duration: 10,
            initialDuration: 0,
            controller: _countDownController,
            width: AppSize.height200,
            height: AppSize.height200,
            ringColor: AppColors.primary,
            ringGradient: LinearGradient(
              colors: [AppColors.primary, AppColors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            fillColor: AppColors.system,
            backgroundColor: AppColors.system,
            strokeWidth: 20.0,
            strokeCap: StrokeCap.round,
            textStyle: getSemiBoldStyle(
                color: AppColors.white, fontSize: AppSize.font30),
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
          SizedBox(
            height: AppSize.height40,
          ),
          SizedBox(
              height: AppSize.height60,
              width: AppSize.width100,
              child: PrimaryButton(onPressed: () {}, title: AppStrings.start)),
          SizedBox(
            height: AppSize.height40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.pause_circle_outline,
                    color: AppColors.primary,
                    size: AppSize.height40,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.restart_alt_outlined,
                    color: AppColors.primary,
                    size: AppSize.height40,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings_outlined,
                    color: AppColors.primary,
                    size: AppSize.height40,
                  )),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPomodoroBody();
  }
}
