import 'package:e_commerce_app/HomeScrren/Brands/Cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/usecase/drands_use_case.dart';

class BrandsViewModel extends Cubit<BrandeState>{
 BrandsUseCase useCase;
  BrandsViewModel(this.useCase):super(BrandeLoadingState());
void getAllBrands()async {
  emit(BrandeLoadingState());
 try{
   var response=await useCase.invoke();
   if(response?.statusMsg=='fail'){
     emit(BrandeErrorState(errorMassage: response?.message??'error'));
   }else{
     emit(BrandeSuccessState(response: response));

   }
 }catch(e){
   emit(BrandeErrorState(errorMassage: e.toString()));
 }

}


}