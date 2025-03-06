import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/home/data/home_data_source/home_data_source.dart';

import '../../../domain/usecase/usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  Usecase usecase;
  HomeCubit(this.usecase) : super(HomeInitial());
   singOut(){
    emit(HomeLoadingSignout());
    usecase.call().then((result) {
      emit(HomeSuccessSignout());
    }).catchError((error) {
      emit(HomeFailureSignout( errorMessage: error));
    });

   }
}