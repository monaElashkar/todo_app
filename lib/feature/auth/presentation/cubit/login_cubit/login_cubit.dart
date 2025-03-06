import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/auth/data/data_Source/login_data_source/login_data_source.dart';
import 'package:todo_app/feature/auth/presentation/cubit/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginDataSource loginDataSource;
  LoginCubit(this.loginDataSource) : super(LoginInitial());
  login({required String email,required String password})async{
  
    emit(LoginLouding());
    final result = await loginDataSource.login(
        email: email, password: password,);
    result.fold((l) {
      emit(LoginFailure(massage: l));
    }, (r) {
      emit(LoginSuccess());
    });
  }
}