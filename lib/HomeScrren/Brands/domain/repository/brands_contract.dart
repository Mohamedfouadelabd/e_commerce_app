import '../../../../data/model/Response/GetallCategory/BrandSourceResponse.dart';

abstract class BrandsContract{
  Future <BrandSourceResponse?>getAllBrands({int page = 1});


}