import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_strings.dart';
import 'package:nixo/core/utils/app_styles.dart';
import 'package:nixo/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:nixo/features/settings/presentation/widgets/settings_box.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Widget _buildSettingsBody() {
    return Column(
      children: [
        SizedBox(
          height: AppSize.height20,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: AppSize.height50,
              backgroundImage: NetworkImage(
                  "https://img.freepik.com/photos-gratuite/portrait-homme-blanc-isole_53876-40306.jpg?w=2000"),
              backgroundColor: AppColors.redBox,
            ),
            SizedBox(
              width: AppSize.width10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Boualleg Seif Eddine',
                  style: getSemiBoldStyle(
                      color: AppColors.white, fontSize: AppSize.font17),
                ),
                SizedBox(
                  height: AppSize.height10,
                ),
                Text(
                  'LVL.1',
                  style: getSemiBoldStyle(
                      color: AppColors.white, fontSize: AppSize.font17),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: AppSize.height50,
        ),
        const SettingsBox(
          icon: Icons.settings,
          title: 'general',
        ),
        const SettingsBox(
          icon: Icons.person,
          title: 'Account',
        ),
        const SettingsBox(
          icon: Icons.color_lens_rounded,
          title: 'Apearence',
        ),
        const SettingsBox(
          icon: Icons.feedback,
          title: 'FeedBack',
        ),
        const SettingsBox(
          icon: Icons.info,
          title: 'About',
        ),
        SizedBox(
          height: AppSize.height30,
        ),
        SizedBox(
          height: AppSize.height45,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.redBox.withOpacity(0.3),
            ),
            onPressed: () {
              BlocProvider.of<AuthCubit>(context).loggedOut();
            },
            child: Text(
              AppStrings.signout,
              style: getSemiBoldStyle(
                color: AppColors.redBox,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: AppSize.p24),
        color: AppColors.system,
        child: _buildSettingsBody());
  }
}
