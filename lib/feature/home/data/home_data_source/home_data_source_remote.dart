import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/feature/home/data/home_data_source/home_data_source.dart';
import 'package:todo_app/feature/home/data/model/task_model.dart';

import '../../../../core/common/api_const/collections_key.dart';

class HomeDataSourceRemote  implements HomeDataSource{
  @override
  Future< void> signOut() async{
      return     await FirebaseAuth.instance.signOut();
  }
  
  @override
  Future<List<TaskModel>?> getToDoTasksData() async{
    List<TaskModel> tasks=[] ;
    await FirebaseFirestore.instance.collection(CollectionsKey.tasks)
    .snapshots().listen((value){
      tasks =[];
      for (var value in value.docs) {
        if(value.exists){
          tasks.add(TaskModel.fromJson(value.data()) );
        }
      }
    });
    return tasks;
  }
  
  @override
  Future<void> addTask(TaskModel task)async {
    await FirebaseFirestore.instance.collection(CollectionsKey.tasks)
    .add(
     task.toJson()
    ).then((value){
      task.id= value.id;
      FirebaseFirestore.instance.
      collection(CollectionsKey.tasks).doc(value.id).update(
       {"id":value.id}
      );
    });
  }

}