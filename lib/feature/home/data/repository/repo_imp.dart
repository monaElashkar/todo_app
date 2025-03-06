import 'package:dartz/dartz.dart';
import 'package:todo_app/feature/home/data/model/task_model.dart';
import 'package:todo_app/feature/home/domain/repository/repo.dart';

import '../home_data_source/home_data_source.dart';

class RepoImp implements Repo{
  HomeDataSource homeDataSource;
  RepoImp(this.homeDataSource);
  @override
  Future<Either<String, void>> signOut() async{
     try{
       await homeDataSource.signOut(); // Simulating sign out operation

      return Right(null);
    }catch(e){
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<TaskModel>>> getToDoTasksData() async{
    try{
      List<TaskModel> result = await homeDataSource.getToDoTasksData()??[];

      return Right(result); // Simulating getting tasks data operation
    }catch(e){
      return Left(e.toString());
    }

  }
  
  @override
  Future<Either<String, void>> addTask(TaskModel task)async {
   try{
     await homeDataSource.addTask(task); // Simulating adding task operation
   }catch(e){
     return Left(e.toString());
   }
    return Right(null);
  }
  
}