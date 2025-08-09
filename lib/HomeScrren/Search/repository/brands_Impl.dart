
import 'package:e_commerce_app/HomeScrren/Search/domain/repository/brands_contract.dart';
import 'package:e_commerce_app/data/model/Response/GetallCategory/BrandSourceResponse.dart';

import '../domain/repository/brands_remote_data_soure.dart';
import 'brands_remote_data_source_Iimpl.dart';

class BrandsSearchImpl implements BrandsContractSearch{
  BrandsRemoteDataSource remoteDataSource ;
  BrandsSearchImpl({required this.remoteDataSource});
  @override
  Future<BrandSourceResponse?> searchBrand( String name) {
return remoteDataSource.searchBrand(name);
  }

}

BrandsContractSearch injectBrandsContractSearch(){
  return BrandsSearchImpl(remoteDataSource: injectBrandsSearchRemoteDataSource());


}