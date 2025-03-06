import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

import '../../../../../core/common/widget/custom_app_bar.dart';
import '../../../../../core/common/widget/custom_background.dart';
import '../../../../../core/common/widget/custom_buttom.dart';
import '../../../../../core/common/widget/custom_snack_bar.dart';
import '../../../../../core/common/widget/custom_text_form_filde.dart';
import '../../../../../core/routing/route_name.dart';
import '../../../data/data_Source/register_data_source/register_data_source.dart';
import '../../../data/data_Source/register_data_source/register_data_source_remote.dart';
import '../../cubit/register_cubit/register_cubit.dart';
import '../../cubit/register_cubit/register_state.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(RegisterDataSourceRemote()),
      child: CustomBackground(
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              print("Register success");
                Navigator.pushNamedAndRemoveUntil(
                context, RouteName.home, (route) => false,);
            } else if (state is RegisterFailed) {
              showSnackBar(context, state.message);
              print("Failed to register user: ${state.message}");
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: CustomAppBar(title: 'REGISTER'),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w).copyWith(top: 60.h),
                  child: Form(
                    key: _globalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextFormFilde(
                            hintText: 'EMAIL',
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              } else if (value.contains('@') == false) {
                                return 'Enter valid email';
                              } else if (value.contains('.com') == false) {
                                return 'Enter valid email address';
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(
                          height: 28.32.h,
                        ),
                        CustomTextFormFilde(
                          hintText: 'NAME',
                          keyboardType: TextInputType.name,
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Name is required';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 28.32.h,
                        ),
                        CustomTextFormFilde(
                          hintText: 'PASSWORD',
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            } else if (value.length < 6) {
                              return 'Password should be at least 6 characters long';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 28.32.h,
                        ),
                        CustomTextFormFilde(
                          hintText: 'CONFIRM PASSWORD',
                          keyboardType: TextInputType.visiblePassword,
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Confirm password is required';
                            } else if (value != passwordController.text) {
                              return 'Passwords do not match';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 49.82.h,
                        ),
                        CustomButtom(
                          text: 'REGISTER',
                          onTap: () {
                            if (_globalKey.currentState!.validate()) {
                              final cubit=BlocProvider.of<RegisterCubit>(context);
                              cubit.register(
                                email: emailController.text, 
                                password: passwordController.text,
                                 name: nameController.text);
                              // register
                            }
                          },
                        ),
                      ],
                    ),
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
