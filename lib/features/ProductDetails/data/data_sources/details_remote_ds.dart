import '../models/SingleProductModel.dart';

abstract class DetailsRemoteDataSource {
  Future<SingleProductModel> sendSingleProductRequest(String? id);
}
