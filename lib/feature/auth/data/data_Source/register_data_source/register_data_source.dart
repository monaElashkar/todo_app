import 'package:dartz/dartz.dart';

abstract class RegisterDataSource{

  Future<Either<String, String>> register({required String email,required String password,required String name});

}