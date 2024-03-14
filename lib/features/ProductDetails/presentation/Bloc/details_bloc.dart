import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/api/api_manager.dart';
import '../../data/data_sources/details_remote_ds.dart';
import '../../data/data_sources/details_remote_ds_impl.dart';
import '../../data/repositories/details_repo_impl.dart';
import '../../domain/entities/singleProductEntity.dart';
import '../../domain/repositories/details_repo.dart';
import '../../domain/use_cases/get_single_product_use_case.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  ApiManager apiManager;
  String? currentId;

  static DetailsBloc get(context) => BlocProvider.of(context);

  DetailsBloc(this.apiManager) : super(DetailsInitial()) {
    on<DetailsEvent>((event, emit) async {
      if (event is GetSpecificProductEvent) {
        currentId = event.id;
        print("assigned event id to $currentId");
        emit(state.copyWith(screenStatus: ScreenStatus.loading));
        DetailsRemoteDataSource detailsRemoteDataSource =
            DetailsRemoteDsImpl(apiManager);
        DetailsRepo detailsRepo = DetailsRepoImpl(detailsRemoteDataSource);
        GetSingleProductUseCase getProductsUseCase =
            GetSingleProductUseCase(detailsRepo, currentId);
        try {
          var res = await getProductsUseCase.call(currentId);
          emit(state.copyWith(
              screenStatus: ScreenStatus.success, currentProduct: res.data));
          print("name is ${state.currentProduct?.name}");
        } catch (e) {
          print(e.toString());
          emit(state.copyWith(screenStatus: ScreenStatus.failure));
        }
      }
    });
  }
}
