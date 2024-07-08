import 'package:ecommerce_route/data/repos/auth/auth_repo_impl.dart';
import 'package:ecommerce_route/domain/use%20cases/login_use_case.dart';
import 'package:ecommerce_route/ui/screens/auth/login/login_view_model.dart';
import 'package:ecommerce_route/ui/screens/auth/signup/signup_screen.dart';
import 'package:ecommerce_route/ui/utils/app_assets.dart';
import 'package:ecommerce_route/ui/utils/app_colors.dart';
import 'package:ecommerce_route/ui/utils/base_states.dart';
import 'package:ecommerce_route/ui/utils/dialog_utils.dart';
import 'package:ecommerce_route/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel viewModel = LoginViewModel(LoginUseCase(AuthRepoImpl()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocListener(
        bloc: viewModel,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(AppAssets.routeLogo),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Welcome Back To Route",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Please sign in with your mail",
                  style: TextStyle(
                    color: AppColors.white.withOpacity(0.7),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Email Address",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  hintText: "enter your Email Address",
                  controller: viewModel.emailController,
                  type: TextInputType.emailAddress,
                  validator: (email) {
                    if(email!.trim().isEmpty){
                      return "please enter email";
                    }
                    final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email);
                    if(!emailValid){
                      return "Email format is not valid";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Password",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  hintText: "enter your Password",
                  controller: viewModel.passwordController,
                  type: TextInputType.visiblePassword,
                  isPassword: viewModel.isPassword,
                  validator: (password) {
                    if(password!.isEmpty) {
                      return "please enter password";
                    }
                    if(password.trim().length < 6){
                      return "password should be at least 6 characters";
                    }
                    return null;
                  },
                  suffix: IconButton(
                      onPressed: () {
                        viewModel.isPassword = !viewModel.isPassword;
                        setState(() {});
                      },
                      icon: Icon(
                          viewModel.isPassword ? Icons.visibility : Icons.visibility_off)),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forget Password",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    viewModel.login();
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(14),
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                      child: const Text(
                        "Create Account",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        listener: (context, state) {
          if(state is BaseLoadingState){
            showLoading(context);
          }else if (state is BaseSuccessState){
            Navigator.pop(context);
          }else if (state is BaseErrorState){
            Navigator.pop(context);
            showErrorDialog(context, state.errorMessage);
          }
        },
      ),
    );
  }

}