import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_constants.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_strings.dart';
import 'package:nixo/core/utils/app_styles.dart';
import 'package:nixo/core/widgets/app_bar.dart';
import 'package:nixo/core/widgets/calendarListTile.dart';
import 'package:nixo/core/widgets/primary_btn.dart';
import 'package:nixo/features/Calendar/presentation/pages/calendar_screen.dart';
import 'package:nixo/features/home/presentation/widgets/add_task_textfield.dart';
import 'package:nixo/features/pomodoro/presentation/pages/pomodoro_screen.dart';
import 'package:nixo/features/settings/presentation/pages/settings_screen.dart';
import 'package:nixo/features/tasks/presentation/pages/tasks_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wheel_chooser/wheel_chooser.dart';
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
  final TextEditingController _addTaskController = TextEditingController();
  final TextEditingController _addDescriptionController =
      TextEditingController();
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  DateTime _setTime = DateTime.now();
  DateTime _setDuration = DateTime(2000, 1, 1, 0, 5, 0);
  String _setReminder = 'None';
  List<String> _reminders = [
    'None',
    'On time',
    '5 mins early',
    '30 mins early',
    '1 hr early',
    '1 day early',
  ];
  String _setRepeat = 'No Repeat';
  List<String> _repeats = [
    'No Repeat',
    'Daily',
    'Weekday',
    'Weekly',
    'Monthly',
    'Yearly',
  ];

  var _flagsmenuList = [
    PopupMenuItem(
      child: ListTile(
        leading: Icon(
          Icons.flag_rounded,
          color: AppColors.mistakes,
        ),
        title: Text(
          AppStrings.urgentAndImportantAll,
          style: getMediumStyle(
              color: AppColors.mistakes, fontSize: AppSize.font14),
        ),
      ),
    ),
    PopupMenuItem(
      child: ListTile(
        leading: Icon(
          Icons.flag_rounded,
          color: AppColors.orangeBox,
        ),
        title: Text(
          AppStrings.notUrgentAndImportantAll,
          style: getMediumStyle(
              color: AppColors.orangeBox, fontSize: AppSize.font14),
        ),
      ),
    ),
    PopupMenuItem(
      child: ListTile(
        leading: Icon(
          Icons.flag_rounded,
          color: AppColors.primary,
        ),
        title: Text(
          AppStrings.urgentAndNotImportantAll,
          style: getMediumStyle(
              color: AppColors.primary, fontSize: AppSize.font14),
        ),
      ),
    ),
    PopupMenuItem(
      child: ListTile(
        leading: Icon(
          Icons.flag_rounded,
          color: AppColors.success,
        ),
        title: Text(
          AppStrings.notUrgentAndNotImportantAll,
          style: getMediumStyle(
              color: AppColors.success, fontSize: AppSize.font14),
        ),
      ),
    ),
  ];
  var _groupMenuList = [
    PopupMenuItem(
      child: ListTile(
        leading: Icon(
          Icons.attach_money,
          color: AppColors.white,
        ),
        title: Text(
          'Work',
          style:
              getMediumStyle(color: AppColors.white, fontSize: AppSize.font14),
        ),
      ),
    ),
    PopupMenuItem(
      child: ListTile(
        leading: Icon(
          Icons.sports_baseball,
          color: AppColors.primary,
        ),
        title: Text(
          'Sports',
          style: getMediumStyle(
              color: AppColors.primary, fontSize: AppSize.font14),
        ),
      ),
    ),
    PopupMenuItem(
      child: ListTile(
        leading: Icon(
          Icons.flag_rounded,
          color: AppColors.success,
        ),
        title: Text(
          'Learning',
          style: getMediumStyle(
              color: AppColors.success, fontSize: AppSize.font14),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    _presistentController = PersistentTabController(initialIndex: _currentPage);
    _advancedDrawerController = AdvancedDrawerController();
    super.initState();
  }

  @override
  void dispose() {
    _presistentController.dispose();
    _advancedDrawerController.dispose();
    _addTaskController.dispose();
    _addDescriptionController.dispose();
    super.dispose();
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
        body: _buildBottomNavBar(),
        resizeToAvoidBottomInset: true,
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }

  _buildFloatingActionButton() {
    return Container(
      margin: EdgeInsets.only(bottom: AppSize.m60),
      child: SpeedDial(
        icon: Icons.add,
        iconTheme: IconThemeData(color: AppColors.system),
        activeIcon: Icons.close,
        backgroundColor: AppColors.primary,
        activeBackgroundColor: AppColors.primary,
        overlayColor: AppColors.transparent,
        overlayOpacity: 0.5,
        spaceBetweenChildren: AppSize.height10,
        visible: true,
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
            child: Icon(Icons.task_alt_outlined, color: AppColors.system),
            backgroundColor: AppColors.boxColor2,
            onTap: () {
              _buildBottomSheetAddTask();
            },
            labelWidget: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.height15, vertical: AppSize.height8),
              decoration: BoxDecoration(
                color: AppColors.boxColor2,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSize.radius15),
                ),
              ),
              child: Text(
                AppStrings.addTask,
                style: getMediumStyle(color: AppColors.system),
              ),
            ),
          ),
          SpeedDialChild(
            child: Icon(Icons.folder_outlined, color: AppColors.system),
            backgroundColor: AppColors.boxColor2,
            onTap: () {},
            labelWidget: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.height15, vertical: AppSize.height8),
              decoration: BoxDecoration(
                color: AppColors.boxColor2,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSize.radius15),
                ),
              ),
              child: Text(
                AppStrings.adddGroup,
                style: getMediumStyle(color: AppColors.system),
              ),
            ),
          ),
          SpeedDialChild(
            child: Icon(Icons.my_location_outlined, color: AppColors.system),
            backgroundColor: AppColors.boxColor2,
            onTap: () {},
            labelWidget: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.height15, vertical: AppSize.height8),
              decoration: BoxDecoration(
                color: AppColors.boxColor2,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSize.radius15),
                ),
              ),
              child: Text(
                AppStrings.addGoal,
                style: getMediumStyle(color: AppColors.system),
              ),
            ),
          ),
        ],
      ),
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

  _buildBottomSheetAddTask() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.transparent,
      isScrollControlled: true,
      builder: (_) {
        return SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.radius20),
                color: AppColors.navbarColor),
            width: double.infinity,
            padding: EdgeInsets.only(
              left: AppSize.height20,
              right: AppSize.height20,
              bottom: AppSize.height20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.width120),
                  child: Divider(
                      thickness: AppSize.height2,
                      color: AppColors.appBarIConColor),
                ),
                SizedBox(
                  height: AppSize.height20,
                ),
                AddTaskTextField(
                    title: AppStrings.whatWouldYouLokeToDo,
                    maxLines: 1,
                    textInputType: TextInputType.text,
                    minLines: 1,
                    textController: _addTaskController),
                SizedBox(
                  height: AppSize.height20,
                ),
                AddTaskTextField(
                    title: AppStrings.note,
                    maxLines: null,
                    textInputType: TextInputType.multiline,
                    minLines: 4,
                    textController: _addDescriptionController),
                SizedBox(
                  height: AppSize.height20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _buildClendarPicker();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.transparent,
                              shape: const CircleBorder(),
                              padding: EdgeInsets.all(AppSize.height8)),
                          child: Icon(Icons.calendar_month_outlined,
                              color: AppColors.appBarIConColor),
                        ),
                        PopupMenuButton(
                          color: AppColors.navbarColor,
                          itemBuilder: (context) {
                            return _flagsmenuList;
                          },
                          icon: Icon(Icons.flag_sharp,
                              color: AppColors.appBarIConColor),
                        ),
                        PopupMenuButton(
                          color: AppColors.navbarColor,
                          itemBuilder: (context) {
                            return _groupMenuList;
                          },
                          icon: Icon(Icons.local_offer_outlined,
                              color: AppColors.appBarIConColor),
                        ),
                      ],
                    ),
                    PrimaryButton(onPressed: () {}, title: AppStrings.save)
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  _buildClendarPicker() {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: AppColors.navbarColor,
              content: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                child: Column(
                  children: [
                    TableCalendar(
                      firstDay: DateTime.utc(2010, 1, 1),
                      headerVisible: true,
                      lastDay: DateTime.utc(2030, 12, 31),
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      },
                      onPageChanged: (focusedDay) {
                        // No need to call `setState()` here
                        _focusedDay = focusedDay;
                      },
                      calendarFormat: CalendarFormat.month,
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle:
                            getMediumStyle(color: AppColors.appBarIConColor),
                        weekendStyle:
                            getMediumStyle(color: AppColors.appBarIConColor),
                      ),
                      focusedDay: _selectedDay,
                      calendarStyle: CalendarStyle(
                        isTodayHighlighted: true,
                        selectedDecoration: BoxDecoration(
                            color: AppColors.primary, shape: BoxShape.circle),
                        todayDecoration: BoxDecoration(
                            color: AppColors.boxColor, shape: BoxShape.circle),
                        defaultTextStyle:
                            getMediumStyle(color: AppColors.white),
                        disabledTextStyle:
                            getMediumStyle(color: AppColors.white),
                        weekendTextStyle: getLightStyle(color: AppColors.hint),
                        selectedTextStyle:
                            getMediumStyle(color: AppColors.system),
                        outsideTextStyle: getLightStyle(color: AppColors.hint),
                        todayTextStyle: getMediumStyle(color: AppColors.white),
                      ),
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleTextStyle: getMediumStyle(
                            color: AppColors.primary, fontSize: AppSize.font16),
                        titleTextFormatter: (date, locale) =>
                            DateFormat.yMMMMd(locale).format(date),
                      ),
                    ),
                    SizedBox(height: AppSize.height10),
                    CalendarListTile(
                        onTap: () {
                          _buildSetTime(context, setState);
                        },
                        title: AppStrings.setTime,
                        suffixText: DateFormat.Hm().format(_setTime),
                        prefixIcon: Icons.access_time),
                    SizedBox(height: AppSize.height10),
                    CalendarListTile(
                        onTap: () {
                          _buildSetDuration(context, setState);
                        },
                        title: AppStrings.setDuration,
                        suffixText: DateFormat.Hms().format(_setDuration),
                        prefixIcon: Icons.access_time),
                    SizedBox(height: AppSize.height10),
                    CalendarListTile(
                        onTap: () {
                          _buildSetReminder(context, setState);
                        },
                        title: AppStrings.setReminder,
                        suffixText: _setReminder,
                        prefixIcon: Icons.access_time),
                    SizedBox(height: AppSize.height10),
                    CalendarListTile(
                        onTap: () {
                          _buildSetRepeat(context, setState);
                        },
                        title: AppStrings.setRepeat,
                        suffixText: _setRepeat,
                        prefixIcon: Icons.access_time),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: Text(
                    'Cancel',
                    style: getMediumStyle(color: AppColors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(
                    'OK',
                    style: getMediumStyle(color: AppColors.primary),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
        });
  }

  _buildSetTime(context, setState1) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState2) {
            return AlertDialog(
              backgroundColor: AppColors.navbarColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.setTime,
                    style: getBoldStyle(
                        color: AppColors.white, fontSize: AppSize.font18),
                  ),
                  Text(
                    DateFormat.Hm().format(_setTime),
                    style: getMediumStyle(
                        color: AppColors.primary, fontSize: AppSize.font18),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: AppSize.width50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Hours',
                          style: getLightStyle(
                              color: AppColors.white, fontSize: AppSize.font12),
                        ),
                        Text(
                          'Minutes',
                          style: getLightStyle(
                              color: AppColors.white, fontSize: AppSize.font12),
                        ),
                      ],
                    ),
                  ),
                  TimePickerSpinner(
                    is24HourMode: true,
                    time: _setTime,
                    normalTextStyle: TextStyle(
                        fontSize: AppSize.font18, color: AppColors.white),
                    highlightedTextStyle: TextStyle(
                        fontSize: AppSize.font30, color: AppColors.primary),
                    spacing: AppSize.width30,
                    itemHeight: AppSize.height50,
                    isForce2Digits: true,
                    onTimeChange: (time) {
                      setState1(() {
                        setState2(() {
                          _setTime = time;
                        });
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppStrings.ok,
                      style: getBoldStyle(color: AppColors.primary),
                    ))
              ],
            );
          });
        });
    // return showTimePicker(
    //   initialEntryMode: TimePickerEntryMode.inputOnly,
    //   context: context,
    //   initialTime: TimeOfDay.now(),
    // );
  }

  _buildSetDuration(context, setState1) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState2) {
            return AlertDialog(
              backgroundColor: AppColors.navbarColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.setDuration,
                    style: getBoldStyle(
                        color: AppColors.white, fontSize: AppSize.font18),
                  ),
                  Text(
                    DateFormat.Hms().format(_setDuration),
                    style: getMediumStyle(
                        color: AppColors.primary, fontSize: AppSize.font18),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Hours',
                        style: getLightStyle(
                            color: AppColors.white, fontSize: AppSize.font12),
                      ),
                      Text(
                        'Minutes',
                        style: getLightStyle(
                            color: AppColors.white, fontSize: AppSize.font12),
                      ),
                      Text(
                        'Seconds',
                        style: getLightStyle(
                            color: AppColors.white, fontSize: AppSize.font12),
                      ),
                    ],
                  ),
                  TimePickerSpinner(
                    is24HourMode: true,
                    time: _setDuration,
                    isShowSeconds: true,
                    normalTextStyle: TextStyle(
                        fontSize: AppSize.font18, color: AppColors.white),
                    highlightedTextStyle: TextStyle(
                        fontSize: AppSize.font30, color: AppColors.primary),
                    spacing: AppSize.width30,
                    itemHeight: AppSize.height50,
                    isForce2Digits: true,
                    onTimeChange: (time) {
                      setState1(() {
                        setState2(() {
                          _setDuration = time;
                        });
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppStrings.ok,
                      style: getBoldStyle(color: AppColors.primary),
                    ))
              ],
            );
          });
        });
    // return showTimePicker(
    //   initialEntryMode: TimePickerEntryMode.inputOnly,
    //   context: context,
    //   initialTime: TimeOfDay.now(),
    // );
  }

  _buildSetReminder(context, setState1) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState2) {
            return AlertDialog(
              backgroundColor: AppColors.navbarColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.setReminder,
                    style: getBoldStyle(
                        color: AppColors.white, fontSize: AppSize.font18),
                  ),
                  Text(
                    _setReminder,
                    style: getMediumStyle(
                        color: AppColors.primary, fontSize: AppSize.font15),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  WheelChooser(
                    listHeight: AppSize.height100,
                    onValueChanged: (s) {
                      setState1(() {
                        setState2(() {
                          _setReminder = s;
                        });
                      });
                    },
                    datas: _reminders,
                  ),
                  //   CupertinoPicker(
                  //       itemExtent: AppSize.height80,
                  //       backgroundColor: AppColors.navbarColor,

                  //       onSelectedItemChanged: (item) {
                  //         setState1(() {
                  //           setState2(() {
                  //             _setReminder = item;
                  //           });
                  //         });
                  //       },
                  //       children: _reminders
                  //           .map((e) => Text(
                  //                 e,
                  //                 style: getMediumStyle(color: AppColors.white),
                  //               ))
                  //           .toList())
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppStrings.ok,
                      style: getBoldStyle(color: AppColors.primary),
                    ))
              ],
            );
          });
        });
    // return showTimePicker(
    //   initialEntryMode: TimePickerEntryMode.inputOnly,
    //   context: context,
    //   initialTime: TimeOfDay.now(),
    // );
  }

  _buildSetRepeat(context, setState1) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState2) {
            return AlertDialog(
              backgroundColor: AppColors.navbarColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.setRepeat,
                    style: getBoldStyle(
                        color: AppColors.white, fontSize: AppSize.font18),
                  ),
                  Text(
                    _setRepeat,
                    style: getMediumStyle(
                        color: AppColors.primary, fontSize: AppSize.font15),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  WheelChooser(
                    listHeight: AppSize.height100,
                    onValueChanged: (s) {
                      setState1(() {
                        setState2(() {
                          _setRepeat = s;
                        });
                      });
                    },
                    datas: _repeats,
                  ),
                  //   CupertinoPicker(
                  //       itemExtent: AppSize.height80,
                  //       backgroundColor: AppColors.navbarColor,

                  //       onSelectedItemChanged: (item) {
                  //         setState1(() {
                  //           setState2(() {
                  //             _setReminder = item;
                  //           });
                  //         });
                  //       },
                  //       children: _reminders
                  //           .map((e) => Text(
                  //                 e,
                  //                 style: getMediumStyle(color: AppColors.white),
                  //               ))
                  //           .toList())
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppStrings.ok,
                      style: getBoldStyle(color: AppColors.primary),
                    ))
              ],
            );
          });
        });
    // return showTimePicker(
    //   initialEntryMode: TimePickerEntryMode.inputOnly,
    //   context: context,
    //   initialTime: TimeOfDay.now(),
    // );
  }
}
