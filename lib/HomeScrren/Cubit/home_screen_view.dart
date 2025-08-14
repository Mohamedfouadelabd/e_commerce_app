import 'package:e_commerce_app/HomeScrren/Cubit/state.dart';
import 'package:e_commerce_app/Theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../CategoryFragment/category_fragment.dart';

import '../domain/use_case.dart';
import 'home_screen_viewModel.dart';

class HomeScreenView extends StatefulWidget {
  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  HomeScreenViewModel viewModel =
  HomeScreenViewModel(injectGetCategoryUseCase());
  final ScrollController scrollController = ScrollController();

  int currentPage = 1;
  bool isLoadingMore = false;

  @override
  void initState() {
    // TODO: implement initState
    viewModel.getCategory();
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
    viewModel.getCategory(page: currentPage);
    setState(() => isLoadingMore = false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is HomeScreenLoadingState) {
          return Center(
              child: CircularProgressIndicator(
                color: MyTheme.primary,
              ));
        } else if (state is HomeScreenErrorState) {
          return Column(
            children: [
              Text(state.errorMassage ?? ""),
              ElevatedButton(onPressed: () {}, child: Text('TryAgain')),
            ],
          );
        } else if (state is HomeScreenSuccessState) {
          var datalist = state.response?.data ?? [];
          return ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: datalist.length,
            itemBuilder: (context, index) {
              return CategoryFragment(data: datalist[index]);
            },
          );
        }

        return Container();
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
