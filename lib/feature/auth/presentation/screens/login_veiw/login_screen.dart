import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/common/widget/custom_background.dart';
import 'package:todo_app/core/common/widget/custom_buttom.dart';
import 'package:todo_app/core/common/widget/custom_text_form_filde.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

import '../../../../../core/common/widget/custom_app_bar.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
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
                    if (formKey.currentState!.validate()) {}
                  },
                  text: "LOGIN",
                ),
                SizedBox(
                  height: 51.22.h,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "SIGNUP",
                    style: AppTextStyle.size24SimeBoldsignUpColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
