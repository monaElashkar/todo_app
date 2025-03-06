import 'package:bloc/bloc.dart';
import 'package:todo_app/feature/home/presentation/cubit/add_cubit/add_state.dart';

import '../../../data/model/task_model.dart';
import '../../../domain/usecase/get_todo_tasks_usecase.dart';

class AddCubit extends Cubit<AddState>{
  final GetTodoTasksUsecase getTodoTasksUsecase;
  AddCubit(this.getTodoTasksUsecase) : super(IntitialAddState());
   addTask(TaskModel task){
  emit(TodoAddLoading());
  getTodoTasksUsecase.addTask(task).then(
    (res){
     res.fold(
       (error) => emit(TodoAddFailure(error: error)),
       (tasks) => emit(TodoAddSuccess()));
  });
 }
}