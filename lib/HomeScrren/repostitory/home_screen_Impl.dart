import 'package:e_commerce_app/HomeScrren/domain/repository/category_home_screen_contract.dart';
import 'package:e_commerce_app/HomeScrren/repostitory/category_remote_data_source_impl.dart';
import 'package:e_commerce_app/data/model/Response/GetallCategory/CategoryResponse.dart';

import '../domain/repository/category_remote_date_soure.dart';

class HomeScreenCategoryImpl implements HomeScreenCategoryContract{
  CategoryRemoteDataSource remoteDataSource;
  HomeScreenCategoryImpl({required this.remoteDataSource});
  @override
  Future<CategoryResponse?> getAllCategory({int page = 1,}) {
 return remoteDataSource.getAllCategory(page: page);
  }



}
HomeScreenCategoryContract  injectHomeScreenCategoryContract(){

  return HomeScreenCategoryImpl(remoteDataSource: injectCategoryRemoteDataSource());
}