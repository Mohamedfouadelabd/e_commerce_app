import '../../../data/model/Response/GetallCategory/BrandSourceResponse.dart';

abstract class BrandeSearchState{}
class BrandeSearchLoadingState extends BrandeSearchState{}
class BrandeSearchErrorState  extends BrandeSearchState{
  String errorMassage;
  BrandeSearchErrorState({required this.errorMassage});
}
class BrandeSearchSuccessState  extends BrandeSearchState{
  BrandSourceResponse ?response;
  BrandeSearchSuccessState({required this.response});

}