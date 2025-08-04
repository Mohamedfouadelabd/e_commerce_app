import 'package:e_commerce_app/data/model/Response/GetallCategory/BrandSourceResponse.dart';

abstract class BrandeState{}
class BrandeLoadingState extends BrandeState{}
class BrandeErrorState  extends BrandeState{
  String errorMassage;
  BrandeErrorState({required this.errorMassage});
}
class BrandeSuccessState  extends BrandeState{
  BrandSourceResponse ?response;
  BrandeSuccessState({required this.response});

}