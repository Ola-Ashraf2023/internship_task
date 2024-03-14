import '../entities/singleProductEntity.dart';

abstract class DetailsRepo {
  Future<SingleProductEntity> getSingleProduct(String? id);
}
