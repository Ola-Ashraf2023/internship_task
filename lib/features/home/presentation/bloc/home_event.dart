part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetProductEvent extends HomeEvent {}

// class GetSpecificProductEvent extends HomeEvent {
//   String ?id;
//   GetSpecificProductEvent(this.id);
// }
