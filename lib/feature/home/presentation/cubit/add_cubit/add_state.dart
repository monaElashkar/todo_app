class AddState {}
class IntitialAddState extends AddState {}
class TodoAddLoading extends AddState {}
class TodoAddSuccess extends AddState {
}
class TodoAddFailure extends AddState {
  String error;
  TodoAddFailure({required this.error});
}