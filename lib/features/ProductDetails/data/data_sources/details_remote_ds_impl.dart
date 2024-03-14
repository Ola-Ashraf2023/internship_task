import 'package:dio/dio.dart';
import 'package:internship_task/features/ProductDetails/data/data_sources/details_remote_ds.dart';
import 'package:internship_task/features/ProductDetails/data/models/SingleProductModel.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/utils/constants.dart';

class DetailsRemoteDsImpl implements DetailsRemoteDataSource {
  ApiManager apiManager;

  DetailsRemoteDsImpl(this.apiManager);

  @override
  Future<SingleProductModel> sendSingleProductRequest(String? id) async {
    try {
      print(Constants.BASEURL + "/$id");
      Response response = await apiManager.getData(endPoint: "/$id", data: {});
      print("---------------------------------------------");
      print(response.data);
      print("---------------------------------------------");
      SingleProductModel productModel =
          SingleProductModel.fromJson(response.data);
      print(productModel.data?.name);
      return productModel;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }
}
