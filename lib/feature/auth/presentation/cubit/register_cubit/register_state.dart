abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoadingStart extends RegisterState {}
class RegisterLoadingEnd extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailed extends RegisterState {
  String message;
  RegisterFailed({required this.message});
}
