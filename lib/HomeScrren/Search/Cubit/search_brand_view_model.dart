import 'package:e_commerce_app/HomeScrren/Search/Cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/usecase/drands_use_case.dart';

class BrandSearchViewModel extends Cubit<BrandeSearchState>{
  BrandsSearchUseCase useCase;
  BrandSearchViewModel ({required this.useCase}):super(BrandeSearchLoadingState());

void search(String name)async{
try{
  emit(BrandeSearchLoadingState());
  var response=await useCase.invoke(name);
  if(response?.statusMsg=='fail'){
    emit(BrandeSearchErrorState(errorMassage: response?.message??""));

  }else{
    emit(BrandeSearchSuccessState(response: response));
}}catch(e){
  emit(BrandeSearchErrorState(errorMassage: e.toString()));

}
}

}


