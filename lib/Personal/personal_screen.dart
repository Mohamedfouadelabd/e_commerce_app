
import 'package:e_commerce_app/Personal/cust_continar.dart';
import 'package:e_commerce_app/Personal/provider/cust_text.dart';
import 'package:e_commerce_app/Personal/provider/user_provider.dart';
import 'package:e_commerce_app/Theme/my_Theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
   var provider =Provider.of<UserProvider>(context);
    return Column(
crossAxisAlignment: CrossAxisAlignment.start,
      children: [
     SizedBox(
       height: MediaQuery.of(context).size.height*0.1,
     ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Welcome ,${provider.user!.name}',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 25

          ),


          ),
        ),
Padding(
  padding: const EdgeInsets.all(2),
  child:   Text(provider.user!.email,
  style: Theme.of(context).textTheme.titleSmall,

  ),
),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.05,
        ),
        CustText(titel: 'Your full name'),
CustContinar(description: provider.user!.name),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.02,
        ),

        CustText(titel: 'Your E-mail'),
        CustContinar(description: provider.user!.email),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.02,
        ),
        CustText(titel: 'Your password'),
        CustContinar(description: provider.user!.password),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.02,
        ),
        CustText(titel: 'Your mobile number'),
        CustContinar(description: provider.user!.mobileNumber)
      ],


    );
  }
}
