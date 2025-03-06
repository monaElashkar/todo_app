import 'package:dartz/dartz.dart';

import '../../data/model/task_model.dart';
import '../repository/repo.dart';

class GetTodoTasksUsecase {
  Repo repo;
  GetTodoTasksUsecase({required this.repo});
  Future<Either<String, void>> call ()=> repo.getToDoTasksData();
  Future<Either<String, void>> addTask (TaskModel t)=> repo.addTask(t);
  
}