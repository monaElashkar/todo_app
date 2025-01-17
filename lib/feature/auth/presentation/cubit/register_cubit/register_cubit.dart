import 'package:bloc/bloc.dart';
import 'package:todo_app/feature/auth/presentation/cubit/register_cubit/register_state.dart';

import '../../../data/data_Source/register_data_source/register_data_source.dart';

class RegisterCubit extends Cubit<RegisterState>{
   RegisterDataSource registerDataSource;

  RegisterCubit(this.registerDataSource) : super(RegisterInitial());

  Future<void> register({required String email,required String password})async{
    registerDataSource.register(email: email, password: password);
  }

}