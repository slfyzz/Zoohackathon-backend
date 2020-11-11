import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nature_finder/utilites/authentication.dart';
import 'package:nature_finder/utilites/constants.dart';
import 'package:nature_finder/widgets/form_item.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo_with_name_row.png'),
          FormItem("mail",Icons.mail,false),
          SizedBox(height: 10,),
          FormItem("password",Icons.lock,true),
          SizedBox(height: 30,),
          RaisedButton(
            onPressed: (){
              handleLogin(kEmail,kPassword1);
            },
            elevation: 0,
            child: Container( width: 200,child: Center(child: Text("LOG IN"))),
          ),
        ],
      ),
    );
  }

  Future<void> handleLogin(String mail,String pass) async {
    // bool signed = await Auth().logIn(mail,pass);
    // if(signed)
      Navigator.of(context).pushNamed('/home');
  }
}


