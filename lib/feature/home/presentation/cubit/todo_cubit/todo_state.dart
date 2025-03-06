import '../../../data/model/task_model.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}
class TodoSuccess extends TodoState {
  List<TaskModel> tasks;
  TodoSuccess({required this.tasks});
}
class TodoFailure extends TodoState {
  String error;
  TodoFailure({required this.error});
}





