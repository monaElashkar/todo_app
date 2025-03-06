import 'package:dartz/dartz.dart';

abstract class LoginDataSource {
  Future<Either<String, void>>  login({required String email,required String password});
}