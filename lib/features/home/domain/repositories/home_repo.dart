import '../entities/ProductEntity.dart';

abstract class HomeRepo {
  Future<ProductEntity> getProducts();
}
