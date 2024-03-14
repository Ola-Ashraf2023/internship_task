import 'package:internship_task/features/ProductDetails/domain/entities/singleProductEntity.dart';
import 'package:internship_task/features/ProductDetails/domain/repositories/details_repo.dart';

import '../data_sources/details_remote_ds.dart';

class DetailsRepoImpl implements DetailsRepo {
  DetailsRemoteDataSource detailsRemoteDataSource;

  DetailsRepoImpl(this.detailsRemoteDataSource);

  @override
  Future<SingleProductEntity> getSingleProduct(String? id) =>
      detailsRemoteDataSource.sendSingleProductRequest(id);
}
