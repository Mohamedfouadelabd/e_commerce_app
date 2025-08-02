import 'package:e_commerce_app/Auth/Register/register_screen.dart';
import 'package:flutter/material.dart';

import '../../Theme/my_Theme.dart';
import '../CustomTextField/custom_text_field.dart';
import '../CustomTextField/cutom_text.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName='login';
  var formkey=GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            style: TextStyle(
              fontSize: 25,
              color: MyTheme.White

            )
            ),
          ),
            Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    CustomText(name: 'E-mail address'),
                    CustomTextFormField(
                      lable: 'enter your email address',
                      controller: emailcontroller,
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
                      controller: passwordcontroller,
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
              height: MediaQuery.of(context).size.height*0.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30)

              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          MyTheme.White
                      )
                  ),
                  onPressed: (){
                    login();

                  }, child: Text('Login',
                  style: Theme.of(context).textTheme.titleSmall
              )),
            ),
            InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(RegisterScreen.routeName);

                },
                child: CustomText(name: 'Don’t have an account?'))

          ],
        ),
      ),
    );
  }

  void login() {
if(formkey.currentState!.validate()==true){}

  }
}
