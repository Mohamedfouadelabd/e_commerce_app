

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
@override
  void initState() {
    // TODO: implement initState
    viewModel.getAllBrands();
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
}
