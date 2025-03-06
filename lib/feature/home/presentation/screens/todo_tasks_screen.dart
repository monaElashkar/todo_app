import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/routing/route_name.dart';
import 'package:todo_app/feature/home/data/model/task_model.dart';
import 'package:todo_app/feature/home/domain/usecase/get_todo_tasks_usecase.dart';

import '../../../../core/common/api_const/collections_key.dart';
import '../../data/home_data_source/home_data_source_remote.dart';
import '../../data/repository/repo_imp.dart';
import '../cubit/todo_cubit/todo_cubit.dart';
import '../cubit/todo_cubit/todo_state.dart';
import '../widgets/custom_item.dart';

class TodoTasksScreen extends StatelessWidget {
  const TodoTasksScreen({super.key});
   Stream<QuerySnapshot<Map<String, dynamic>>> getToDoTasksData() {
    
    return FirebaseFirestore.instance.collection(CollectionsKey.tasks)
    .snapshots();
  }

  @override
  Widget build(BuildContext context) {
     GetTodoTasksUsecase getTodoTasksUsecase=GetTodoTasksUsecase(repo: RepoImp(HomeDataSourceRemote()));
    return BlocProvider(
      create: (context) => TodoCubit(
        GetTodoTasksUsecase(repo: RepoImp(HomeDataSourceRemote())),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, RouteName.add);
              }),
          body: StreamBuilder(
            stream:  getToDoTasksData(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                List<TaskModel> tasks =[];
                if(snapshot.data!=null){
                  snapshot.data!.docs.forEach((element) {
                  tasks.add(TaskModel.fromJson(element.data()));
                });}
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    if (tasks[index].check == false) {
                      return CustomItem(
                        title: tasks[index].title ?? "",
                        subTitle: tasks[index].subTitle ?? "",
                        value: tasks[index].check ?? false,
                        onChanged: (value) {},
                      );
                    }
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: tasks.length,
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              return Container();
            },
          )

          // BlocBuilder<TodoCubit, TodoState>(
          //   builder: (context, state) {
          //     if (state is TodoLoading || state is TodoInitial) {
          //       return Center(child: CircularProgressIndicator());
          //     } else if (state is TodoSuccess) {
          //       return StreamBuilder<TodoCubit>(
          //           stream: BlocProvider.of<TodoCubit>(context).getTodoTasks(),
          //           builder: (context, snapshot) {
          //             return ListView.separated(
          //               padding: const EdgeInsets.all(16),
          //               itemBuilder: (context, index) {
          //                 if (state.tasks[index].check == false) {
          //                   return CustomItem(
          //                     title: state.tasks[index].title ?? "",
          //                     subTitle: state.tasks[index].subTitle ?? "",
          //                     value: state.tasks[index].check ?? false,
          //                     onChanged: (value) {},
          //                   );
          //                 }
          //               },
          //               separatorBuilder: (BuildContext context, int index) {
          //                 return const SizedBox(
          //                   height: 10,
          //                 );
          //               },
          //               itemCount: state.tasks.length,
          //             );
          //
          // });
          //     } else if (state is TodoFailure) {
          //       return Center(child: Text(state.error));
          //     }
          //     return Container();
          //   },
          // ),
          ),
    );
  }
}
