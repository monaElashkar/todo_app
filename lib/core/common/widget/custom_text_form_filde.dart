import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

import '../../theme/app_colors.dart';

class CustomTextFormFilde extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const CustomTextFormFilde({super.key,
  required this.controller,
  required this.hintText,
  this.keyboardType,
  required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82.h,
      width: 400.w,
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 17.h),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.drGrayColor,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        cursorColor: AppColors.appBarColor,
        style: AppTextStyle.size20SimeBoldwhiteColor,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: AppColors.secondaryColor,
            width:3 
          )),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: AppColors.appBarColor,
            width:3 
          )),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: AppColors.redColor,
            width:3 
          )),
          border: UnderlineInputBorder(
              borderSide: BorderSide(
            color: AppColors.secondaryColor,
            width:3 
          )),
          hintText: hintText,
          hintStyle: AppTextStyle.size20SimeBoldwhiteColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
        ),
      ),
    );
  }
}
