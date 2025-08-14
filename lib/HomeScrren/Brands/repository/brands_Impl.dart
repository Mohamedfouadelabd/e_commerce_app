import 'package:e_commerce_app/HomeScrren/Brands/domain/repository/brands_contract.dart';
import 'package:e_commerce_app/HomeScrren/Brands/repository/brands_remote_data_source_Iimpl.dart';
import 'package:e_commerce_app/data/model/Response/GetallCategory/BrandSourceResponse.dart';

import '../domain/repository/brands_remote_data_soure.dart';

class BrandsImpl implements BrandsContract{
  BrandsRemoteDataSource remoteDataSource ;
  BrandsImpl({required this.remoteDataSource});
  @override
  Future<BrandSourceResponse?> getAllBrands({int page = 1}) {
return remoteDataSource.getAllBrands(page: page);
  }

}

BrandsContract injectBrandsContract(){
  return
    BrandsImpl(remoteDataSource: injectBrandsRemoteDataSource());


}