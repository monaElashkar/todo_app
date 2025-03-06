import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/common/api_const/collections_key.dart';
import 'login_data_source.dart';

class LoginDataSourceRemote  implements LoginDataSource{
  @override
  Future<Either<String, void>> login({
    required String email,
     required String password})async {
   try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
  if (credential.user!= null) {
    FirebaseFirestore.instance.collection(CollectionsKey.users)
    .doc(credential.user!.uid).get().then((value){
      print("exists :${value.exists}");
      if(value.exists){
        value.data();
        print(value.data().toString());
      }
    })
      
;
    return Right(null);
  } else {
    return Left('Failed to login with provided credentials.');
  }
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    return Left('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    return Left('Wrong password provided for that user.');
  }

  } catch (e) {
    return Left('An error occurred while trying to login: $e');
  }
  return Left('An error occurred while trying to login.');
  }


}