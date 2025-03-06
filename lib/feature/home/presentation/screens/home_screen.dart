import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/common/widget/custom_background.dart';
import 'package:todo_app/feature/home/data/home_data_source/home_data_source_remote.dart';
import 'package:todo_app/feature/home/data/repository/repo_imp.dart';
import 'package:todo_app/feature/home/domain/usecase/usecase.dart';

import '../../../../core/common/widget/custom_snack_bar.dart';
import '../../../../core/routing/route_name.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import '../cubit/home_cubit/home_cubit.dart';
import '../cubit/home_cubit/home_state.dart';
import 'done_tasks_screen.dart';
import 'todo_tasks_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController? controller = PageController(
    initialPage: 0,
  );
  int selectedIndex = 0;
  @override
  void initState() {
    controller = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(Usecase(repo:RepoImp(HomeDataSourceRemote()) )),
      child: CustomBackground(
          child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeSuccessSignout) {
            // Navigate to login screen
            Navigator.pushNamedAndRemoveUntil(
              context, RouteName.login,
              (route) => false,);
          }
          if (state is HomeFailureSignout) {
            showSnackBar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                // automaticallyImplyLeading: false,
                backgroundColor: AppColors.appBarColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                  ),
                ),
                title: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (selectedIndex != 0) {
                          controller!.jumpToPage(0);
                          selectedIndex = 0;
                        }
                      },
                      child: Column(
                        children: [
                          Text(
                            "TODO",
                            style: selectedIndex == 0
                                ? AppTextStyle.size32SimeBoldsecondaryColor
                                : AppTextStyle.size32RegulargrayColor,
                          ),
                          Container(
                            color: selectedIndex == 0
                                ? AppColors.grayColor
                                : Colors.transparent,
                            height: 1.h,
                            width: 90.w,
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 34.h),
                    Container(
                      color: AppColors.grayColor,
                      height: 48.89.h,
                      width: 1.w,
                    ),
                    SizedBox(width: 34.h),
                    InkWell(
                      onTap: () {
                        if (selectedIndex != 1) {
                          controller!.jumpToPage(1);
                          selectedIndex = 1;
                        }
                      },
                      child: Column(
                        children: [
                          Text(
                            "DONE",
                            style: selectedIndex == 1
                                ? AppTextStyle.size32SimeBoldsecondaryColor
                                : AppTextStyle.size32RegulargrayColor,
                          ),
                          Container(
                            color: selectedIndex == 1
                                ? AppColors.grayColor
                                : Colors.transparent,
                            height: 1.h,
                            width: 90.w,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      // TODO: Add new item functionality
                      final cubit =BlocProvider.of<HomeCubit>(context);
                      cubit.singOut();
                      print('New item button clicked');
                    },
                    icon: Image.asset("assets/icons/logout_icon.png"),
                  ),
                ],
              ),
              body: PageView(
                controller: controller,
                onPageChanged: (index) {
                  controller!.jumpToPage(index);
                  selectedIndex = index;
                  print("controller index: ${selectedIndex}");
                  setState(() {});
                },
                scrollDirection: Axis.horizontal,
                children: const [
                  TodoTasksScreen(),
                  DoneTasksScreen(),
                ],
              )

              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     CustomItem(
              //       title: 'title',
              //       subTitle: 'subTitle',
              //       value: true,
              //       onChanged: onChanged,
              //     ),
              //   ],
              // ),
              );
        },
      )),
    );
  }

  void Function(bool?)? onChanged(value) {}
}
