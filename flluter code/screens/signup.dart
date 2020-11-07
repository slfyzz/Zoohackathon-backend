import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nature_finder/widgets/form_item.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo_with_name_row.png'),
          FormItem("Name",Icons.person,false),
          SizedBox(height: 10,),
          FormItem("Mail",Icons.mail,false),
          SizedBox(height: 10,),
          FormItem("Password",Icons.lock,true),
          SizedBox(height: 30,),
          RaisedButton(
            onPressed: (){
              //handle sign up
              Navigator.pushNamed(context, '/home');
            },
            elevation: 0,
            child: Container( width: 200,child: Center(child: Text("Sign Up"))),
          ),
        ],
      ),
    );
  }
}
