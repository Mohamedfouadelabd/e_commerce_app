


import 'package:e_commerce_app/data/model/Response/RegisterResponse/User.dart';

class RegisterResponseDto {
  RegisterResponseDto(
      {this.message, this.user, this.token, this.statusMsg, this.error});

  String? message;
  User? user;
  String? token;
  Error? error;
  String? statusMsg;
}
