import 'package:e_commerce_app/HomeScrren/domain/repository/category_home_screen_contract.dart';
import 'package:e_commerce_app/data/model/Response/GetallCategory/CategoryResponse.dart';


import '../repostitory/home_screen_Impl.dart';

class GetCategoryUseCase{
  HomeScreenCategoryContract screenCategoryContract;
  GetCategoryUseCase({required this.screenCategoryContract});

Future <CategoryResponse?>invoke({int page = 1,}){

  return screenCategoryContract.getAllCategory(page: page);
}


}

GetCategoryUseCase injectGetCategoryUseCase(){
  return GetCategoryUseCase(screenCategoryContract:injectHomeScreenCategoryContract());

}