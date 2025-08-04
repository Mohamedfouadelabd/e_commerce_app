import 'package:e_commerce_app/HomeScrren/Cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/use_case.dart';

class HomeScreenViewModel extends Cubit<HomeScreenState>{

  GetCategoryUseCase useCase;
  HomeScreenViewModel(this .useCase):super(HomeScreenLoadingState());
 void getCategory()async{
   emit(HomeScreenLoadingState());
 try {
   var response = await useCase.invoke();
   if (response?.statusMsg == 'fail') {
     emit(HomeScreenErrorState(errorMassage: response?.message ?? "Error"));
   } else {
     emit(HomeScreenSuccessState(response: response));
   }
 }catch(e){
  emit(HomeScreenErrorState(errorMassage: e.toString()));

 }
 }

 }

