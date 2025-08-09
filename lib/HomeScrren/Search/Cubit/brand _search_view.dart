import 'package:e_commerce_app/HomeScrren/Search/Cubit/search_brand_view_model.dart';
import 'package:e_commerce_app/HomeScrren/Search/Cubit/state.dart';
import 'package:e_commerce_app/Theme/my_Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/usecase/drands_use_case.dart';
import '../search_Item.dart';

class BrandsSearchView extends StatefulWidget {
  final String name;
  const BrandsSearchView({Key? key, required this.name}) : super(key: key);

  @override
  State<BrandsSearchView> createState() => _BrandsViewState();
}

class _BrandsViewState extends State<BrandsSearchView> {
  late BrandSearchViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = BrandSearchViewModel(useCase: injectBrandsSearchUseCase());
    viewModel.search(widget.name);
  }

  @override
  void didUpdateWidget(covariant BrandsSearchView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.name != widget.name) {
      viewModel.search(widget.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandSearchViewModel, BrandeSearchState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is BrandeSearchLoadingState) {
          return Center(
            child: CircularProgressIndicator(color: MyTheme.primary),
          );
        } else if (state is BrandeSearchErrorState) {
          return Column(
            children: [
              Text(state.errorMassage ?? ""),
              ElevatedButton(
                onPressed: () => viewModel.search(widget.name),
                child: const Text('Try Again'),
              ),
            ],
          );
        } else if (state is BrandeSearchSuccessState) {
          var brandsList = state.response?.data ?? [];
          if (brandsList.isEmpty) {
            return const Center(child: Text("No results found"));
          }
          return ListView.builder(
            itemCount: brandsList.length,
            itemBuilder: (context, index) {
              return SearchItem(data: brandsList[index]);
            },
          );
        }
        return Container();
      },
    );
  }
}
