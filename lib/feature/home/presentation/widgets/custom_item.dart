import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/theme/app_text_style.dart';
import '../../../../core/theme/app_colors.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key,
  required this.title,
  required this.subTitle,
  required this.value,
  required this.onChanged});
  final String  title;
  final String  subTitle;
  final bool? value;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82.h,
      width: 400.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.drGrayColor,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 23.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.size24SimeBoldsecondaryColor,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subTitle,
                    style: AppTextStyle.size16RegulargrayColor,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Checkbox(
              fillColor: WidgetStateProperty.all(Colors.transparent),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.r)),
              side: WidgetStateBorderSide.resolveWith(
                (states) =>
                    BorderSide(width: 1.0, color: AppColors.secondaryColor),
              ),
              value: value,
              onChanged: onChanged),
        ],
      ),
    );
  }
}
