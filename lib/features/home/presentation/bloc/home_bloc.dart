import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:internship_task/features/home/data/models/ProductModel.dart';
import 'package:meta/meta.dart';

import '../../../../core/api/api_manager.dart';
import '../../data/data_sources/remote/home_remote_ds.dart';
import '../../data/data_sources/remote/home_remote_ds_impl.dart';
import '../../data/repositories/home_repo_impl.dart';
import '../../domain/entities/ProductEntity.dart';
import '../../domain/repositories/home_repo.dart';
import '../../domain/use_cases/get_products_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  ApiManager apiManager;
  static HomeBloc get(context) => BlocProvider.of(context);
  HomeBloc(this.apiManager) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetProductEvent) {
        emit(state.copyWith(screenStatus: ScreenStatus.loading));
        HomeRemoteDataSource homeRemoteDataSource =
        HomeRemoteDataSourceImpl(apiManager);
        HomeRepo homeRepo = HomeRepoImpl(homeRemoteDataSource);
        GetProductsUseCase getProductsUseCase =
        GetProductsUseCase(homeRepo);
        try {
          var res = await getProductsUseCase.call();
          emit(state.copyWith(
              screenStatus: ScreenStatus.success, products: res.data));
        } catch (e) {
          print(e.toString());
          emit(state.copyWith(screenStatus: ScreenStatus.failure));
        }
      }
    });
  }
}
