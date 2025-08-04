import '../../../data/model/Response/GetallCategory/CategoryResponse.dart';

abstract class CategoryRemoteDataSource{
  Future<CategoryResponse?>getAllCategory();


}