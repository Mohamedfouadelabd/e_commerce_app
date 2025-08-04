import 'package:e_commerce_app/data/model/Response/GetallCategory/CategoryResponse.dart';

abstract class HomeScreenState{}

class HomeScreenLoadingState extends HomeScreenState{}
class HomeScreenErrorState extends HomeScreenState{
  String errorMassage;

  HomeScreenErrorState({required this.errorMassage});
}
class HomeScreenSuccessState extends HomeScreenState{
  CategoryResponse? response ;
  HomeScreenSuccessState({required this.response});

}