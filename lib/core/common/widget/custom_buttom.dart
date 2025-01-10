import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

class CustomButtom extends StatelessWidget{
  final void Function()? onTap;
  final String text;

  const CustomButtom({super.key,required this.onTap,required this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 82.h,
        width: 400.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.drGrayColor,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(text,
        style: AppTextStyle.size24SimeBolddrGrayColor,),
      ),
    );
  }

}