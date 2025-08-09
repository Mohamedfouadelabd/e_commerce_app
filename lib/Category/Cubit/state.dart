import 'package:e_commerce_app/data/model/Response/ProductResponse/ProductSourceResponse.dart';

abstract class ProductState{}
class ProductLoadingState extends ProductState{}
class ProductErrorState extends ProductState{
  String errorMassage;
  ProductErrorState({required this.errorMassage});
}
class ProductSuccessState extends ProductState{
  ProductSourceResponse? response;

  ProductSuccessState({required this.response});
}