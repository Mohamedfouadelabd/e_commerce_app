import 'package:e_commerce_app/Auth/Login/domain/Login_response_contract.dart';
import 'package:e_commerce_app/Auth/Login/repository/datasource/Login_response_Impl.dart';
import 'package:e_commerce_app/data/model/Response/LoginResponse/LoginResponse.dart';

class LoginUseCase{
 LoginResponseContract responseContract;
 LoginUseCase ({required this.responseContract});
  Future<LoginResponse?>invoke(String email,String password){

    return responseContract.login(email, password);

  }

}
LoginUseCase ingectLoginUseCase(){

  return LoginUseCase(responseContract: injectLoginResponseContract());
}
