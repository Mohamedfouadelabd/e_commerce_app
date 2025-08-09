import 'package:e_commerce_app/Category/Cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/use_case.dart';

class ProductViewModel extends Cubit<ProductState>{
  ProductUseCase useCase;

  ProductViewModel(this.useCase):super(ProductLoadingState());
void getAllProduct()async{
  emit(ProductLoadingState());
 try{
   var response=await useCase.invoke();
   if(response?.statusMsg=='fail'){
     emit(ProductErrorState(errorMassage: response?.message??'error'));
   }else{

     emit(ProductSuccessState(response: response));
   }
 }catch(e){
   emit(ProductErrorState(errorMassage: e.toString()));

 }
}

}