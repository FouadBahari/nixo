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
import 'package:nixo/features/auth/domain/entities/user_entity.dart';
import 'package:nixo/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:nixo/features/auth/presentation/cubit/credenial_state.dart';
import 'package:nixo/features/auth/presentation/cubit/credential_cubit.dart';
import 'package:nixo/features/home/presentation/pages/main_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  final formGlobalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.system,
      body: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          } else if (credentialState is CredentialFailure) {
            AppConstants.snackBarNetwork(
                msg: "Wrong infos, please check!",
                scaffoldState: _scaffoldState);
          }
        },
        builder: (context, credentialState) {
          if (credentialState is CredentialLoading) {
            return AppConstants.loadingIndicatorProgressBar();
          } else if (credentialState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return const MainScreen();
                } else {
                  print("Unauthenticated");
                  return _buildSignUpBody();
                }
              },
            );
          } else if (credentialState is CredentialFailure) {
            return _buildSignUpBody();
          }
          return BlocBuilder<AuthCubit, AuthState>(
            builder: (context, authState) {
              if (authState is Authenticated) {
                return const MainScreen();
              } else {
                print("Unauthenticated");
                return _buildSignUpBody();
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildSignUpBody() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.authbackground),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(
            top: AppSize.m80, left: AppSize.m24, right: AppSize.m24),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                              Navigator.pushNamed(
                                  context, AppRoutes.loginRoute);
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
              Form(
                key: formGlobalKey,
                child: Column(
                  children: [
                    CustomTextField(
                      validator: (userName) {
                        if (!AppConstants.isUserNameValid(userName!)) {
                          return AppStrings.validuserName;
                        }
                        return null;
                      },
                      textController: _usernameController,
                      title: AppStrings.username,
                    ),
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
                    CustomTextField(
                      validator: (password) {
                        if (!AppConstants.isPasswordValid(password!)) {
                          return AppStrings.validPassword;
                        }
                        return null;
                      },
                      textController: _passwordController,
                      title: AppStrings.password,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSize.height80),
              SizedBox(
                height: AppSize.height50,
                width: double.infinity,
                child: PrimaryButtom(
                    onPressed: () {
                      _submitSignUp();
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
                      onPressed: () {
                        BlocProvider.of<CredentialCubit>(context)
                            .facebookAuthSubmit();
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
                      onPressed: () {
                        BlocProvider.of<CredentialCubit>(context)
                            .googleAuthSubmit();
                      },
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
      ),
    );
  }

  _submitSignUp() {
    if (!formGlobalKey.currentState!.validate()) {
      return;
    }

    BlocProvider.of<CredentialCubit>(context).signUpSubmit(
      user: UserEntity(
        avatar: '',
        id: '',
        email: _emailController.text,
        username: _usernameController.text,
        password: _passwordController.text,
      ),
    );
    _emailController.clear();
    _passwordController.clear();
    _usernameController.clear();
  }
}
