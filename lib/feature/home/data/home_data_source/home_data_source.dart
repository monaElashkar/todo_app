
import '../model/task_model.dart';

abstract class HomeDataSource {
  Future<void> signOut();
  Future<List<TaskModel>?> getToDoTasksData();
  Future<void> addTask(TaskModel task);
}