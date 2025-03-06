abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingSignout extends HomeState {}
class HomeSuccessSignout extends HomeState {}
class HomeFailureSignout extends HomeState {
  final String errorMessage;
  HomeFailureSignout({required this.errorMessage});
}