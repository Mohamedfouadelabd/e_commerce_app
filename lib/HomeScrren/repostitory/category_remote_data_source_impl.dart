import 'package:e_commerce_app/data/model/Response/GetallCategory/CategoryResponse.dart';

import '../../data/Api/api_manger.dart';
import '../domain/repository/category_remote_date_soure.dart';

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource{
 ApiManger apiManger;
 CategoryRemoteDataSourceImpl({required this.apiManger});
 @override
  Future<CategoryResponse?> getAllCategory()async {
   var response=await apiManger.getAllCategory();
return response;
  }

}

CategoryRemoteDataSource injectCategoryRemoteDataSource(){
  return CategoryRemoteDataSourceImpl(apiManger: ApiManger.getApiInstance());

}