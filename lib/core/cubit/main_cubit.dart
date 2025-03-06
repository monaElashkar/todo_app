import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'main_state.dart';

class MainCubit extends Cubit<MainState>{
  MainCubit() : super(MainInitial());

}