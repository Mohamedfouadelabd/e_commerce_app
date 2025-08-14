import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/HomeScrren/Cubit/state.dart';
import '../../data/model/Response/GetallCategory/CategoryResponse.dart';
import '../../data/model/Response/ProductResponse/ProductSourceResponse.dart';
import '../domain/use_case.dart';

class HomeScreenViewModel extends Cubit<HomeScreenState> {
  final GetCategoryUseCase useCase;

  CategoryResponse ? allData;
  int totalPages = 1;

  HomeScreenViewModel(this.useCase) : super(HomeScreenLoadingState());

  void getCategory({int page = 1}) async {
    if (page == 1) {
      emit(HomeScreenLoadingState());
      allData = null;
    }

    try {
      var response = await useCase.invoke(page: page);

      if (response?.statusMsg == 'fail') {
        emit(HomeScreenErrorState(errorMassage: response?.message ?? "Error"));
      } else {
        totalPages = response?.metadata?.numberOfPages ?? 1;

        if (allData == null) {
          allData = response;
        } else {
          allData?.data?.addAll(response?.data ?? []);
          allData?.metadata = response?.metadata;
        }

        emit(HomeScreenSuccessState(response: allData));
      }
    } catch (e) {
      emit(HomeScreenErrorState(errorMassage: e.toString()));
    }
  }

  bool canLoadMore(int currentPage) {
    return currentPage < totalPages;
  }
}
