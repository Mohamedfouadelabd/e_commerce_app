import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/HomeScrren/Brands/Cubit/state.dart';
import '../../../data/model/Response/GetallCategory/BrandSourceResponse.dart';
import '../domain/usecase/drands_use_case.dart';

class BrandsViewModel extends Cubit<BrandeState> {
  final BrandsUseCase useCase;

  BrandSourceResponse? allData;
  int totalPages = 1;

  BrandsViewModel(this.useCase) : super(BrandeLoadingState());

  void getAllBrands({int page = 1}) async {
    if (page == 1) {
      emit(BrandeLoadingState());
      allData = null;
    }

    try {
      var response = await useCase.invoke(page: page);

      if (response?.statusMsg == 'fail') {
        emit(BrandeErrorState(errorMassage: response?.message ?? 'error'));
      } else {

        totalPages = response?.metadata?.numberOfPages ?? 1;

        if (allData == null) {
          allData = response;
        } else {
          allData?.data?.addAll(response?.data ?? []);
          allData?.metadata = response?.metadata;
        }

        emit(BrandeSuccessState(response: allData));
      }
    } catch (e) {
      emit(BrandeErrorState(errorMassage: e.toString()));
    }
  }

  bool canLoadMore(int currentPage) {
    return currentPage < totalPages;
  }
}
