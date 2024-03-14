import 'package:internship_task/features/home/domain/entities/ProductEntity.dart';
import 'package:internship_task/features/home/domain/repositories/home_repo.dart';

import '../data_sources/remote/home_remote_ds.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(this.homeRemoteDataSource);

  @override
  Future<ProductEntity> getProducts() =>
      homeRemoteDataSource.sendProductRequest();
}
