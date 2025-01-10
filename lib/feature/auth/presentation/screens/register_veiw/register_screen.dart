import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

import '../../../../../core/common/widget/custom_app_bar.dart';
import '../../../../../core/common/widget/custom_background.dart';
import '../../../../../core/common/widget/custom_buttom.dart';
import '../../../../../core/common/widget/custom_text_form_filde.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(title: 'REGISTER'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormFilde(
                hintText: 'EMAIL',
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: (value) {},
              ),
              SizedBox(
                height: 28.32.h,
              ),
              CustomTextFormFilde(
                hintText: 'NAME',
                keyboardType: TextInputType.name,
                controller: nameController,
                validator: (value) {},
              ),
              SizedBox(
                height: 28.32.h,
              ),
              CustomTextFormFilde(
                hintText: 'PASSWORD',
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                validator: (value) {},
              ),
              SizedBox(
                height: 28.32.h,
              ),
              CustomTextFormFilde(
                hintText: 'CONFIRM PASSWORD',
                keyboardType: TextInputType.visiblePassword,
                controller: confirmPasswordController,
                validator: (value) {},
              ),
              SizedBox(
                height: 49.82.h,
              ),
              CustomButtom(
                text: 'REGISTER',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
