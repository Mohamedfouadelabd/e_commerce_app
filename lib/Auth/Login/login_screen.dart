import 'package:e_commerce_app/Auth/Login/Cubit/state.dart';
import 'package:e_commerce_app/Auth/Login/domain/usecase/login_use_case.dart';

import 'package:e_commerce_app/Auth/Register/register_screen.dart';
import 'package:e_commerce_app/dailog%20_utils/Dailog_Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../Main_screen/Main_screen.dart';
import '../../Personal/provider/user_provider.dart';
import '../../Personal/user_model.dart';
import '../../Theme/my_Theme.dart';
import '../CustomTextField/custom_text_field.dart';
import '../CustomTextField/cutom_text.dart';
import 'Cubit/login_screen_view_model.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';
  LoginScreenViewModel viewModel =LoginScreenViewModel(ingectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenViewModel, LoginState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DailogUtils.showLoading(context, state.loadingMassage ?? 'waiting');
        } else if (state is LoginErrorState) {
          DailogUtils.hideLoading(context);
          DailogUtils.showMassage(context, state.errorMassage ?? '',
              posActionName: 'ok');
        } else if (state is LoginSuccessState) {
          DailogUtils.hideLoading(context);
          DailogUtils.showMassage(
            context,
            state.response!.user!.name ?? "",
            titel: 'success',
            posActionName: 'OK',
            posAc: () {
              var userProvider = Provider.of<UserProvider>(context, listen: false);
              userProvider.setUser(
                UserModel(
                  name: viewModel.emailcontroller.text,
                  email: viewModel.emailcontroller.text,
                  mobileNumber: viewModel.passwordcontroller.text,
                  password: viewModel.passwordcontroller.text,
                ),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => MainScreen()),
              );
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: MyTheme.primary,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo_route.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Welcome Back To Route',
                    style: TextStyle(fontSize: 25, color: MyTheme.White)),
              ),
              Form(
                  key: viewModel.formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(name: 'E-mail address'),
                      CustomTextFormField(
                        lable: 'enter your email address',
                        controller: viewModel.emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Email';
                          }

                          bool emailvalid =
                              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(text);
                          if (!emailvalid) {
                            return 'enter valid email';
                          }
                          return null;
                        },
                      ),
                      CustomText(name: 'Password'),
                      CustomTextFormField(
                        lable: 'enter your password',
                        keyboardType: TextInputType.number,
                        controller: viewModel.passwordcontroller,
                        isPassword: true,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Password';
                          }
                          if (text.length < 6) {
                            return 'password greater than 6 char';
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(MyTheme.White)),
                    onPressed: () {
                      viewModel.login();
                    },
                    child: Text('Login',
                        style: Theme.of(context).textTheme.titleSmall)),
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(RegisterScreen.routeName);
                  },
                  child: CustomText(name: 'Don’t have an account?'))
            ],
          ),
        ),
      ),
    );
  }
}
