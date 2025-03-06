abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLouding extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  String massage;
  LoginFailure({required this.massage});
}