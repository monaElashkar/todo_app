import 'package:dartz/dartz.dart';

import '../repository/repo.dart';

class Usecase {
  Repo repo;
  Usecase({required this.repo});
  Future<Either<String, void>> call ()=> repo.signOut();
  
}