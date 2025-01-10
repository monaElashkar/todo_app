import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/common/widget/custom_background.dart';
import 'package:todo_app/core/common/widget/custom_buttom.dart';
import 'package:todo_app/core/common/widget/custom_text_form_filde.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

import '../../../../../core/common/widget/custom_app_bar.dart';

class LoginScreen extends StatelessWidget{
    final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
   return CustomBackground(
     child: Scaffold(
      appBar: CustomAppBar(title: 'LOGIN',),
      backgroundColor: Colors.transparent,
       body: Padding(
         padding:  EdgeInsets.symmetric(horizontal: 5),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             CustomTextFormFilde(
              controller: emailController, 
              hintText: "ENTER YOUR EMAIL", 
              keyboardType: TextInputType.emailAddress,
              validator: (value) => null),
              SizedBox(height: 34.h,),
              CustomTextFormFilde(
              controller: passwordController, 
              keyboardType: TextInputType.visiblePassword,
              hintText: "ENTER YOUR PASSWORD", 
              validator: (value) => null),
              SizedBox(height: 34.h,),
              CustomButtom(onTap: (){},text: "LOGIN",),
              SizedBox(height: 51.22.h,),
              TextButton(
                onPressed: (){},
                child:Text(
                  "SIGNUP",
                  style:AppTextStyle.size24SimeBoldsignUpColor ,
                  ) ,
                ),
           ],
         ),
       ),
     ),
   );
  }
}