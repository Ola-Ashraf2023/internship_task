import '../../models/ProductModel.dart';

abstract class HomeRemoteDataSource {
  Future<ProductModel> sendProductRequest();
}
