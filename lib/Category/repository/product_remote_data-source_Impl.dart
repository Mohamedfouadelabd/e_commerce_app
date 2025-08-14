import 'package:e_commerce_app/Category/domain/repository/product_remote_data_source.dart';
import 'package:e_commerce_app/data/Api/api_manger.dart';
import 'package:e_commerce_app/data/model/Response/ProductResponse/ProductSourceResponse.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource{
 ApiManger apiManger;
 ProductRemoteDataSourceImpl({required this.apiManger}) ;
 @override
  Future<ProductSourceResponse?> getAllProduct({int page = 1,})async {
    var response=await apiManger.getAllProduct(page: page);
return response;
 }

}

ProductRemoteDataSource injectProductRemoteDataSource(){
 return ProductRemoteDataSourceImpl(apiManger: ApiManger.getApiInstance());


}