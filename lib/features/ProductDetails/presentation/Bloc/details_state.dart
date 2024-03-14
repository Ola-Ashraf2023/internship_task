part of 'details_bloc.dart';

enum ScreenStatus {
  init,
  loading,
  success,
  failure,
  changedCarouselIdx,
  changedMaterialIdx,
  changedSizeIdx
}

@immutable
class DetailsState {
  final ScreenStatus? screenStatus;
  SingleProductData? currentProduct;

  DetailsState({this.screenStatus, this.currentProduct});

  DetailsState copyWith(
      {ScreenStatus? screenStatus, SingleProductData? currentProduct}) {
    return DetailsState(
        screenStatus: screenStatus ?? this.screenStatus,
        currentProduct: currentProduct ?? this.currentProduct);
  }
}

class DetailsInitial extends DetailsState {
  DetailsInitial() : super(screenStatus: ScreenStatus.init);
}
