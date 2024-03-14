part of 'details_bloc.dart';

@immutable
abstract class DetailsEvent {}

class GetSpecificProductEvent extends DetailsEvent {
  String? id;

  GetSpecificProductEvent(this.id);
}

class ChangeCarouselIndex extends DetailsEvent {
  int? idx;

  ChangeCarouselIndex(this.idx);
}
