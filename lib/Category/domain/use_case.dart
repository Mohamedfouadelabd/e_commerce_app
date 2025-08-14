import 'package:e_commerce_app/Category/domain/repository/producct_contract.dart';
import 'package:e_commerce_app/Category/repository/product_impl.dart';
import 'package:e_commerce_app/data/model/Response/ProductResponse/ProductSourceResponse.dart';

class ProductUseCase{
  ProductContract productContract;
  ProductUseCase({required this.productContract});


  Future<ProductSourceResponse?>invoke({int page = 1,}){
  return productContract.getAllProduct(page: page);
}


}
ProductUseCase injectProductUseCase(){
  return ProductUseCase(productContract: injectProductContract());


}