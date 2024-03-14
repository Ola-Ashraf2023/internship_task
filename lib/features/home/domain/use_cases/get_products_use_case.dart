import '../entities/ProductEntity.dart';
import '../repositories/home_repo.dart';

class GetProductsUseCase {
  HomeRepo homeRepo;

  GetProductsUseCase(this.homeRepo);

  Future<ProductEntity> call() => homeRepo.getProducts();
}
