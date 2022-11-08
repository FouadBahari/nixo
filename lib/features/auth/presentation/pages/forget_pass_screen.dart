import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nixo/config/routes/app_routes.dart';
import 'package:nixo/core/utils/app_assets.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_constants.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_strings.dart';
import 'package:nixo/core/utils/app_styles.dart';
import 'package:nixo/core/widgets/primary_btn.dart';
import 'package:nixo/core/widgets/text_field.dart';
import 'package:nixo/features/auth/presentation/cubit/credenial_state.dart';
import 'package:nixo/features/auth/presentation/cubit/credential_cubit.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.system,
      body: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, state) {
          if (state is ForgotPasswordSent) {
            AppConstants.snackBarNetwork(
                msg: AppStrings.forgotPasswordSent,
                scaffoldState: _scaffoldState);
          } else if (state is CredentialFailure) {
            AppConstants.snackBarNetwork(
                msg: AppStrings.wrongInfos, scaffoldState: _scaffoldState);
          }
        },
        builder: ((context, state) {
          return _buildingForgetPasswordBody();
        }),
      ),
    );
  }

  Widget _buildingForgetPasswordBody() {
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
                        color: AppColors.white, fontSize: AppSize.font17),
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
                fontSize: AppSize.font19,
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
                fontSize: AppSize.font21,
              ),
            ),
            SizedBox(
              height: AppSize.height100,
            ),
            Form(
              key: formGlobalKey,
              child: Column(
                children: [
                  SizedBox(height: AppSize.height15),
                  CustomTextField(
                    validator: (email) {
                      if (!AppConstants.isEmailValid(email!)) {
                        return AppStrings.validEmail;
                      }
                      return null;
                    },
                    textController: _emailController,
                    title: AppStrings.email,
                  ),
                  SizedBox(height: AppSize.height15),
                ],
              ),
            ),
            SizedBox(
              height: AppSize.height50,
            ),
            SizedBox(
              height: AppSize.height50,
              width: double.infinity,
              child: PrimaryButton(
                  onPressed: () {
                    _submitForgotPassword();
                  },
                  title: AppStrings.reset),
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
                            Navigator.pushReplacementNamed(
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
          ],
        ),
      ),
    );
  }

  _submitForgotPassword() {
    if (!formGlobalKey.currentState!.validate()) {
      return;
    }
    BlocProvider.of<CredentialCubit>(context).forgotPassword(
      email: _emailController.text,
    );
  }
}
