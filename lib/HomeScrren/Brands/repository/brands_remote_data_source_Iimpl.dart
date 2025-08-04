import 'package:e_commerce_app/data/Api/api_manger.dart';
import 'package:e_commerce_app/data/model/Response/GetallCategory/BrandSourceResponse.dart';

import '../domain/repository/brands_remote_data_soure.dart';

class BrandsRemoteDataSourceImpl implements BrandsRemoteDataSource{
  ApiManger apiManger;
  BrandsRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<BrandSourceResponse?> getAllBrands()async {
  var response=await apiManger.getAllBrands();
 return response;
  }

}
BrandsRemoteDataSource injectBrandsRemoteDataSource(){

  return BrandsRemoteDataSourceImpl(apiManger: ApiManger.getApiInstance());


}