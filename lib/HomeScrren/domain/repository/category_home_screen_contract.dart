import 'package:e_commerce_app/data/model/Response/GetallCategory/CategoryResponse.dart';

abstract class HomeScreenCategoryContract{

   Future<CategoryResponse?>getAllCategory();
}