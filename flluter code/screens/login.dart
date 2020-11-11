import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nature_finder/widgets/form_item.dart';

class LogInScreen extends StatelessWidget {
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
              //handle log in
              Navigator.pushNamed(context, '/home');
            },
            elevation: 0,
            child: Container( width: 200,child: Center(child: Text("LOG IN"))),
          ),
        ],
      ),
    );
  }
}
