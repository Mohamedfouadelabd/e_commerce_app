

import 'package:e_commerce_app/data/model/Response/LoginResponse/LoginResponse.dart';

abstract class LoginRemoteDatasource{

  Future<LoginResponse?> login(String email, String password );


}