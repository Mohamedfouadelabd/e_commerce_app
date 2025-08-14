import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/Category/Cubit/state.dart';
import '../domain/use_case.dart';
import '../../data/model/Response/ProductResponse/ProductSourceResponse.dart';

class ProductViewModel extends Cubit<ProductState> {
  final ProductUseCase useCase;

  ProductSourceResponse? allData;
  int totalPages = 1;

  ProductViewModel(this.useCase) : super(ProductLoadingState());

  void getAllProduct({int page = 1}) async {
    if (page == 1) {
      emit(ProductLoadingState());
      allData = null;
    }

    try {
      var response = await useCase.invoke(page: page);

      if (response?.statusMsg == 'fail') {
        emit(ProductErrorState(errorMassage: response?.message ?? 'error'));
      } else {
        totalPages = response?.metadata?.numberOfPages ?? 1;

        if (allData == null) {
          allData = response;
        } else {
          allData?.data?.addAll(response?.data ?? []);
          allData?.metadata = response?.metadata;
        }

        emit(ProductSuccessState(response: allData));
      }
    } catch (e) {
      emit(ProductErrorState(errorMassage: e.toString()));
    }
  }

  bool canLoadMore(int currentPage) {
    return currentPage < totalPages;
  }
}
