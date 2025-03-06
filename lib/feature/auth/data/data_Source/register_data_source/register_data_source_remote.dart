import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/common/api_const/collections_key.dart';
import 'register_data_source.dart';

class RegisterDataSourceRemote implements RegisterDataSource {
  @override
  Future<Either<String, String>> register(
      {required String email,
      required String password,
      required String name}) async {
    try {
      print("before creating");
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("after creating");
      if (credential.user?.uid != null) {
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
        try {
          await firebaseFirestore
              .collection(CollectionsKey.users)
              .doc(credential.user!.uid)
              .set({
            "id": credential.user!.uid,
            "name": name,
            "email": email,
          });
          return Right(credential.user!.uid.toString());
        } catch (e) {
          return Left('Failed to register user.');
        }
      } else {
        return Left('Failed to register user.');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return Left('The email address is already in use.');
      }
    } catch (e) {
      print(e.toString());
      return Left(e.toString());
    }
    return Left('An unexpected error occurred.');
  }
}
