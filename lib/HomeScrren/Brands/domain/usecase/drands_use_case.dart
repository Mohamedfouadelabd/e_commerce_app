import 'package:e_commerce_app/HomeScrren/Brands/domain/repository/brands_contract.dart';
import 'package:e_commerce_app/HomeScrren/Brands/repository/brands_Impl.dart';
import 'package:e_commerce_app/data/model/Response/GetallCategory/BrandSourceResponse.dart';

class BrandsUseCase{
 BrandsContract brandsContract;
 BrandsUseCase({required this.brandsContract});

Future <BrandSourceResponse?>invoke(){
  return brandsContract.getAllBrands();

}
}
BrandsUseCase injectBrandsUseCase(){
  return
    BrandsUseCase(brandsContract: injectBrandsContract());

}