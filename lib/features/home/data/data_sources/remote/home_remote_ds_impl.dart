import 'package:dio/dio.dart';
import 'package:internship_task/core/api/api_manager.dart';
import 'package:internship_task/features/home/data/data_sources/remote/home_remote_ds.dart';
import 'package:internship_task/features/home/data/models/ProductModel.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl(this.apiManager);

  @override
  Future<ProductModel> sendProductRequest() async {
    try {
      Response response = await apiManager.getData(endPoint: "", data: {});
      //print("---------------------------------------------");
      //print(response.data);
      //print("---------------------------------------------");
      ProductModel productModel = ProductModel.fromJson(response.data);
      return productModel;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }

}
