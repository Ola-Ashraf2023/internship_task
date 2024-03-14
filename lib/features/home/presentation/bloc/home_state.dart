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
  SingleProductData? currentProduct;

  HomeState({this.screenStatus, this.products, this.currentProduct});

  HomeState copyWith(
      {ScreenStatus? screenStatus,
      List<Data>? products,
      SingleProductData? currentProduct}) {
    return HomeState(
        screenStatus: screenStatus ?? this.screenStatus,
        products: products ?? this.products,
        currentProduct: currentProduct ?? this.currentProduct);
  }
}

class HomeInitial extends HomeState {
  HomeInitial() : super(screenStatus: ScreenStatus.init);
}
