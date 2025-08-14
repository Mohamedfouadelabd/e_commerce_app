

import 'package:e_commerce_app/HomeScrren/Brands/Cubit/brands_view-model.dart';
import 'package:e_commerce_app/HomeScrren/Brands/Cubit/state.dart';
import 'package:e_commerce_app/HomeScrren/Brands/brands_Item.dart';
import 'package:e_commerce_app/HomeScrren/Brands/domain/usecase/drands_use_case.dart';
import 'package:e_commerce_app/Theme/my_Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandsView extends StatefulWidget {
  @override
  State<BrandsView> createState() => _BrandsViewState();
}

class _BrandsViewState extends State<BrandsView> {
BrandsViewModel viewModel=BrandsViewModel(injectBrandsUseCase());
final ScrollController scrollController = ScrollController();

int currentPage = 1;
bool isLoadingMore = false;
@override
  void initState() {
    // TODO: implement initState
    viewModel.getAllBrands(page: currentPage);
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
  viewModel.getAllBrands(page: currentPage);
  setState(() => isLoadingMore = false);
}
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsViewModel,BrandeState>(
      bloc: viewModel,

      builder: (context, state) {
      if(state is BrandeLoadingState){
        return Center(child: CircularProgressIndicator(
          color: MyTheme.primary,
        ));

      }else if(state is BrandeErrorState){
       return Column(
          children: [
            Text(state.errorMassage ?? ""),
            ElevatedButton(onPressed: () {}, child: Text('TryAgain')),
          ],
        );

      }else if(state is BrandeSuccessState){
        var brandsList=state.response?.data??[];
        return ListView.builder(
controller: scrollController,
          scrollDirection:Axis.horizontal,
          itemCount: brandsList.length,

          itemBuilder: (context, index) {

              return BrandsItem(data: brandsList[index]);
            },
        );

      }
    return Container();
      },);
  }

@override
void dispose() {
  scrollController.dispose();
  super.dispose();
}
}
