

import 'package:e_commerce_app/Category/Cubit/product_view_model.dart';
import 'package:e_commerce_app/Category/Cubit/state.dart';
import 'package:e_commerce_app/Category/domain/use_case.dart';
import 'package:e_commerce_app/Theme/my_Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../category_detils.dart';

class ProductView extends StatefulWidget {
  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  ProductViewModel viewModel = ProductViewModel(injectProductUseCase());
  final ScrollController scrollController = ScrollController();

  int currentPage = 1;
  bool isLoadingMore = false;
  @override
  void initState() {
    // TODO: implement initState
    viewModel.getAllProduct(page: currentPage);
    scrollController.addListener(() {
      final position = scrollController.position;
      if (position.pixels >= position.maxScrollExtent - 200 &&
          !isLoadingMore &&
          viewModel.canLoadMore(currentPage)) {
        loadMore();
      }
    });
  }
  Future<void> loadMore() async {
    setState(() => isLoadingMore = true);
    currentPage++;
    viewModel.getAllProduct(page: currentPage);
    setState(() => isLoadingMore = false);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductViewModel, ProductState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return Center(
                child: CircularProgressIndicator(color: MyTheme.primary,));
          } else if (state is ProductErrorState) {


          } else if (state is ProductSuccessState) {
            var productList = state.response?.data ?? [];
            return GridView.builder(
                controller: scrollController,
                itemCount: productList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  return CategoryDeytilss(data:  productList[index],);
                }


            );
          }
          return Container();
        }
    );
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

}