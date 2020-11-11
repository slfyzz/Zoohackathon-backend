import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nature_finder/utilites/authentication.dart';
import 'package:nature_finder/utilites/constants.dart';
import 'package:nature_finder/widgets/form_item.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  bool signed=false;
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
          SizedBox(height: 10,),
          FormItem("Ensure Password",Icons.lock,true),
          SizedBox(height: 30,),
          RaisedButton(
            onPressed: (){
              handleSignUp(kEmail,kUserName,kPassword1,kPassword2);
            },
            elevation: 0,
            child: Container( width: 200,child: Center(child: Text("Sign Up"))),
          ),
        ],
      ),
    );
  }
  Future<void> handleSignUp(String mail,String name,String pass1,String pass2,) async {
    widget.signed = await Auth().signUp(mail, name, pass1, pass2);
    print(widget.signed);
    if(widget.signed) Navigator.of(context).pushNamed('/home');
  }
}



