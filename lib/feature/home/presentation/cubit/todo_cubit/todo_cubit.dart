import 'package:bloc/bloc.dart';
import 'package:todo_app/feature/home/domain/usecase/get_todo_tasks_usecase.dart';
import 'todo_state.dart';

class TodoCubit extends Cubit<TodoState>{
  GetTodoTasksUsecase getTodoTasksUsecase;
  TodoCubit(
    this.getTodoTasksUsecase,
  ) : super(TodoInitial());

//  getTodoTasks(){
//   emit(TodoLoading());
//   getTodoTasksUsecase.call().then(
//     (res){
//      res.fold(
//        (error) => emit(TodoFailure(error: error)),
//        (tasks) => emit(TodoSuccess(tasks: tasks)));
//   });
//  }

}