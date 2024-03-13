part of 'home_bloc.dart';
enum ScreenStatus {
  init,
  loading,
  success,
  failure,
}
@immutable
class HomeState {
  final ScreenStatus? screenStatus;
  List<Data>? products;

  HomeState(
      {this.screenStatus,
        this.products});

  HomeState copyWith(
      {ScreenStatus? screenStatus,
        List<Data>? products}) {
    return HomeState(
        screenStatus: screenStatus ?? this.screenStatus,
        products: products ?? this.products);
  }
}

class HomeInitial extends HomeState {
  HomeInitial() : super(screenStatus: ScreenStatus.init);
}
