import 'package:e_commerce_app/Category/domain/repository/producct_contract.dart';
import 'package:e_commerce_app/Category/domain/repository/product_remote_data_source.dart';
import 'package:e_commerce_app/Category/repository/product_remote_data-source_Impl.dart';
import 'package:e_commerce_app/data/model/Response/ProductResponse/ProductSourceResponse.dart';

class ProductImpl implements ProductContract{
ProductRemoteDataSource remoteDataSource;
ProductImpl({required this.remoteDataSource});
  @override
  Future<ProductSourceResponse?> getAllProduct() {
   return remoteDataSource.getAllProduct();
  }


}
ProductContract injectProductContract(){
  return ProductImpl(remoteDataSource: injectProductRemoteDataSource());

}