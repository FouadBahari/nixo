import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_constants.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_strings.dart';
import 'package:nixo/core/widgets/app_bar.dart';
import 'package:nixo/features/Calendar/presentation/pages/calendar_screen.dart';
import 'package:nixo/features/pomodoro/presentation/pages/pomodoro_screen.dart';
import 'package:nixo/features/settings/presentation/pages/settings_screen.dart';
import 'package:nixo/features/tasks/presentation/pages/tasks_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreentState();
}

class _MainScreentState extends State<MainScreen> {
  final int _currentPage = 0;
  late PersistentTabController _presistentController;
  late AdvancedDrawerController _advancedDrawerController;

  @override
  void initState() {
    _presistentController = PersistentTabController(initialIndex: _currentPage);
    _advancedDrawerController = AdvancedDrawerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      drawer: _buildDrawer(),
      controller: _advancedDrawerController,
      backdropColor: AppColors.navbarColor,
      animationCurve: Curves.easeInOut,
      animationDuration:
          const Duration(milliseconds: AppConstants.sliderAnimationTime),
      animateChildDecoration: true,
      rtlOpening: false,
      openScale: 0.82,
      disabledGestures: true,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
          appBar: _buildAppBar(),
          backgroundColor: AppColors.system,
          body: _buildBottomNavBar()),
    );
  }

  void _showDrawer() {
    _advancedDrawerController.showDrawer();
  }

  _buildAppBar() {
    return buildAppBar(_showDrawer, Icons.folder_outlined);
  }

  _buildDrawer() {
    return SafeArea(
      child: ExpansionTileTheme(
        data: ExpansionTileThemeData(
            textColor: AppColors.white,
            iconColor: AppColors.white,
            collapsedIconColor: AppColors.white,
            collapsedTextColor: AppColors.white),
        child: ListTileTheme(
          textColor: AppColors.white,
          iconColor: AppColors.white,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            children: [
              SizedBox(
                height: AppSize.height80,
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.wb_sunny_outlined),
                title: const Text(AppStrings.myDayString),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.calendar_month_outlined),
                title: const Text(AppStrings.plannedString),
              ),
              ExpansionTile(
                leading: const Icon(Icons.category_outlined),
                title: const Text(AppStrings.importanceString),
                children: [
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.category_outlined),
                    title: const Text(AppStrings.urgentAndImportant),
                    contentPadding: EdgeInsets.only(left: AppSize.height50),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.category_outlined),
                    title: const Text(AppStrings.notUrgentAndImportant),
                    contentPadding: EdgeInsets.only(left: AppSize.height50),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.category_outlined),
                    title: const Text(AppStrings.urgentAndNotImportant),
                    contentPadding: EdgeInsets.only(left: AppSize.height50),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.category_outlined),
                    title: const Text(AppStrings.notUrgentAndNotImportant),
                    contentPadding: EdgeInsets.only(left: AppSize.height50),
                  ),
                ],
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.category_outlined),
                title: const Text(AppStrings.tasks),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.category_outlined),
                title: const Text(AppStrings.categoriesString),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.category_outlined),
                title: const Text(AppStrings.goalsString),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.category_outlined),
                title: const Text(AppStrings.habitsString),
              ),
              Padding(
                padding: EdgeInsets.all(AppSize.width10),
                child: Divider(
                  color: AppColors.appBarIConColor,
                ),
              ),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  // child: const Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildBottomNavBar() {
    return PersistentTabView(
      context,
      controller: _presistentController,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,

      backgroundColor: AppColors.navbarColor, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: const NavBarDecoration(
        colorBehindNavBar: Colors.white,
      ),
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
      // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const CalendarScreen(),
      const TasksScreen(),
      const PomodoroScreen(),
      const SettingsScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: (AppStrings.home),
        inactiveIcon: const Icon(Icons.home_outlined),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.appBarIConColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.calendar_month),
        title: (AppStrings.calendar),
        inactiveIcon: const Icon(Icons.calendar_month_outlined),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.appBarIConColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.category),
        title: (AppStrings.tasks),
        activeColorPrimary: AppColors.primary,
        inactiveIcon: const Icon(Icons.category_outlined),
        inactiveColorPrimary: AppColors.appBarIConColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.timer),
        title: (AppStrings.pomodoro),
        activeColorPrimary: AppColors.primary,
        inactiveIcon: const Icon(Icons.timer_outlined),
        inactiveColorPrimary: AppColors.appBarIConColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: (AppStrings.settings),
        activeColorPrimary: AppColors.primary,
        inactiveIcon: const Icon(Icons.settings_outlined),
        inactiveColorPrimary: AppColors.appBarIConColor,
      ),
    ];
  }
}
