import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/common/widget/custom_app_bar.dart';
import 'package:todo_app/core/common/widget/custom_background.dart';
import 'package:todo_app/core/common/widget/custom_buttom.dart';
import 'package:todo_app/feature/home/data/home_data_source/home_data_source_remote.dart';
import 'package:todo_app/feature/home/data/model/task_model.dart';
import 'package:todo_app/feature/home/domain/usecase/get_todo_tasks_usecase.dart';
import 'package:todo_app/feature/home/presentation/cubit/add_cubit/add_cubit.dart';

import '../../../../core/common/widget/custom_snack_bar.dart';
import '../../../../core/common/widget/custom_text_form_filde.dart';
import '../../data/repository/repo_imp.dart';
import '../cubit/add_cubit/add_state.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController subTitleController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) =>
          AddCubit(GetTodoTasksUsecase(repo: RepoImp(HomeDataSourceRemote()))),
      child: CustomBackground(
        child: BlocConsumer<AddCubit, AddState>(
          listener: (context, state) {
            if(state is TodoAddFailure){
              showSnackBar(context, state.error);
            }
            if(state is TodoAddLoading){
              print("TodoAddLoading");
            }
           if(state is TodoAddSuccess){
              print("TodoAddSuccess");
            }
          },
          builder: (context, state) {
            return Scaffold(
                  appBar: CustomAppBar(
                    title: '  add task',
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
                              controller: titleController,
                              hintText: "TODO TITLE",
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your title.';
                                }
                                return null;
                              }),
                          SizedBox(
                            height: 34.h,
                          ),
                          CustomTextFormFilde(
                              controller: subTitleController,
                              keyboardType: TextInputType.visiblePassword,
                              hintText: "TODO SUB TITLE",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your sub title.';
                                }
                                return null;
                              }),
                          SizedBox(
                            height: 34.h,
                          ),
                          CustomButtom(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                TaskModel task=TaskModel(
                                  check:false,id:"",
                                  title: titleController.text,
                                  subTitle: subTitleController.text
                                   );
                                var cubit =BlocProvider.of<AddCubit>(context);
                                cubit.addTask(task);
                              }
                            },
                            text: "ADD TODO",
                          ),
                          SizedBox(
                            height: 51.22.h,
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
