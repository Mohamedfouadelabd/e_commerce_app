import '../../../data/model/Response/ProductResponse/ProductSourceResponse.dart';

abstract class ProductRemoteDataSource{

  Future<ProductSourceResponse?>  getAllProduct({int page = 1,});
}