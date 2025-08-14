import 'package:e_commerce_app/data/model/Response/GetallCategory/BrandSourceResponse.dart';

abstract class BrandsRemoteDataSource{
  Future <BrandSourceResponse?>getAllBrands({int page = 1});


}