import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:nixo/config/routes/app_routes.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_strings.dart';
import 'package:nixo/core/utils/app_styles.dart';
import 'package:nixo/core/widgets/primary_btn.dart';
import 'package:nixo/features/home/presentation/widgets/overview_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppinioSwiperController controller = AppinioSwiperController();

  bool _isClicked = true;

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

  var cards = [
    const OverviewCard(),
    const OverviewCard(),
    const OverviewCard(),
  ];

  void _swipe(int index, AppinioSwiperDirection direction) {
    var card = cards[index];
    setState(() {
      cards.removeAt(index);
      cards.add(card);
    });
  }

  void _unswipe(bool unswiped) {
    if (unswiped) {
      print("SUCCESS: card was unswiped");
    } else {
      print("FAIL: no card left to unswipe");
    }
  }

  _buildOverviewContent() {
    return Column(
      children: [
        SizedBox(
          height: AppSize.height200,
          width: double.infinity,
          child: AppinioSwiper(
            cards: cards,
            unlimitedUnswipe: false,
            controller: controller,
            unswipe: _unswipe,
            onSwipe: _swipe,
          ),
        ),
      ],
    );
  }

  _buildProductivityContent() {
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSize.p24),
      color: AppColors.system,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${AppStrings.hello}\nSeifou',
            style: getSemiBoldStyle(
                color: AppColors.white, fontSize: AppSize.font46),
          ),
          SizedBox(height: AppSize.height20),
          _buildTabButtons(),
          _isClicked ? _buildOverviewContent() : _buildProductivityContent(),
        ],
      ),
    );
  }
}
