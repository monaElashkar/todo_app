import 'package:dartz/dartz.dart';

import '../../data/model/task_model.dart';

abstract class Repo {
  Future<Either<String, void>> signOut();
  Future<Either<String, List<TaskModel>>> getToDoTasksData();
  Future<Either<String, void>> addTask(TaskModel task);
}