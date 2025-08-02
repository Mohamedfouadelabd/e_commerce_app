import 'package:e_commerce_app/Auth/Register/domain/repository/repostitory/register_repository_contract.dart';
import 'package:e_commerce_app/data/Api/api_manger.dart';
import 'package:e_commerce_app/data/model/Response/RegisterResponse/RegisterResponse.dart';

class RegisterRepositoryImp implements RegisterRepositoryContract {
  ApiManger apiManger;

  RegisterRepositoryImp({required this.apiManger});

  @override
  Future<RegisterResponse?> register(
      String name,
      String email,
      String password,
      String rePassword,
      String phone,
      ) {
    return apiManger.register(name, email, password, rePassword, phone);
  }
}

RegisterRepositoryContract injectRegisterRepositoryContract() {
  return RegisterRepositoryImp(apiManger: ApiManger.getApiInstance());
}
