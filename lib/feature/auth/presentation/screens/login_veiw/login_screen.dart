import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/common/widget/custom_background.dart';
import 'package:todo_app/core/common/widget/custom_buttom.dart';
import 'package:todo_app/core/common/widget/custom_snack_bar.dart';
import 'package:todo_app/core/common/widget/custom_text_form_filde.dart';
import 'package:todo_app/core/routing/route_name.dart';
import 'package:todo_app/core/theme/app_text_style.dart';
import 'package:todo_app/feature/auth/data/data_Source/login_data_source/login_data_source_remote.dart';
import 'package:todo_app/feature/auth/presentation/cubit/login_cubit/login_cubit.dart';

import '../../../../../core/common/widget/custom_app_bar.dart';
import '../../cubit/login_cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginDataSourceRemote()),
      child: CustomBackground(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              // Navigate to the main screen
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteName.home,
                (route) => false,
              );
            } else if (state is LoginFailure) {
              showSnackBar(context, state.massage);
              // Show error message
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: CustomAppBar(
                title: 'LOGIN',
              ),
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormFilde(
                          controller: emailController,
                          hintText: "ENTER YOUR EMAIL",
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter your email.';
                            if (!value.contains('@'))
                              return 'Please enter a valid email.';
                            return null;
                          }),
                      SizedBox(
                        height: 34.h,
                      ),
                      CustomTextFormFilde(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          hintText: "ENTER YOUR PASSWORD",
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter your password.';
                            if (value.length < 6)
                              return 'Password must be at least 8 characters long.';
                            return null;
                          }),
                      SizedBox(
                        height: 34.h,
                      ),
                      CustomButtom(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            final cubit = BlocProvider.of<LoginCubit>(context);
                            cubit.login(
                                email: emailController.text,
                                password: passwordController.text);
                            print("login function");
                          }
                        },
                        text: "LOGIN",
                      ),
                      SizedBox(
                        height: 51.22.h,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RouteName.register,
                            (route) => false,
                          );
                        },
                        child: Text(
                          "SIGNUP",
                          style: AppTextStyle.size24SimeBoldsignUpColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          
            );
          },
        ),
      ),
    );
  }
}
