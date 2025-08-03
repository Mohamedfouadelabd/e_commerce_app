import 'package:e_commerce_app/Auth/Register/domain/repository/repostitory/register_repository_contract.dart';
import 'package:e_commerce_app/Auth/Register/repository/datarsource/register_repository_imp.dart';
import 'package:e_commerce_app/data/model/Response/RegisterResponse/RegisterResponse.dart';

class RegisterUseCase {
  RegisterRepositoryContract repositoryContract;

  RegisterUseCase({required this.repositoryContract});

  Future<RegisterResponse?> invoke(
      String name,
      String email,
      String password,
      String rePassword,
      String phone,
      ) {
    return repositoryContract.register(name, email, password, rePassword, phone);
  }
}

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(
    repositoryContract: injectRegisterRepositoryContract(),
  );
}
