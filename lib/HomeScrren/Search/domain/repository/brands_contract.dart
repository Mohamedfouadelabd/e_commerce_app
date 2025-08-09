import '../../../../data/model/Response/GetallCategory/BrandSourceResponse.dart';

abstract class BrandsContractSearch{
  Future <BrandSourceResponse?>searchBrand(String name);


}