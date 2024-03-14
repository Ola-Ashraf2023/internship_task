import 'package:internship_task/features/ProductDetails/domain/entities/singleProductEntity.dart';

import '../repositories/details_repo.dart';

class GetSingleProductUseCase {
  DetailsRepo detailsRepo;
  String? productId;

  GetSingleProductUseCase(this.detailsRepo, this.productId);

  Future<SingleProductEntity> call(String? id) =>
      detailsRepo.getSingleProduct(id);
}
