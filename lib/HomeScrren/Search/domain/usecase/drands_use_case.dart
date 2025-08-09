

import 'package:e_commerce_app/HomeScrren/Search/repository/brands_Impl.dart';
import 'package:e_commerce_app/data/model/Response/GetallCategory/BrandSourceResponse.dart';

import '../repository/brands_contract.dart';

class BrandsSearchUseCase{
  BrandsContractSearch brandsContract;
 BrandsSearchUseCase({required this.brandsContract});

Future <BrandSourceResponse?>invoke(String name){
  return brandsContract.searchBrand(name);

}
}
BrandsSearchUseCase injectBrandsSearchUseCase(){
  return
    BrandsSearchUseCase(brandsContract: injectBrandsContractSearch());

}