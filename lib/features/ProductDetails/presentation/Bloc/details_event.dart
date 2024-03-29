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

class ChangeMaterialIndex extends DetailsEvent {
  int? matIdx;

  ChangeMaterialIndex(this.matIdx);
}

class ChangeSizeIndex extends DetailsEvent {
  int? sizeIdx;

  ChangeSizeIndex(this.sizeIdx);
}

class ChangeColorIndex extends DetailsEvent {
  int? colorIdx;

  ChangeColorIndex(this.colorIdx);
}

class ChangeVariationIdx extends DetailsEvent {
  int? variationIdx;

  ChangeVariationIdx(this.variationIdx);
}