import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nature_finder/utilites/constants.dart';

class FormItem extends StatelessWidget {
  final IconData iconData;
  final String hint;
  final bool isPassword;
  FormItem(this.hint, this.iconData ,this.isPassword);
  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(iconData,size: 30,),
        SizedBox(width: 10,),
        Container(
          width: MediaQuery.of(context).size.width*.7,
          height: 40,
          child: TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              filled: true,
              hintText:hint,
              fillColor: Colors.white10,
            ),
            textAlign: TextAlign.center,
            onChanged: (x) {
              if(hint=="Name") kUserName = x;
              if(hint=="Mail") kEmail = x;
              if(hint=="Password" || hint == "password") kPassword1 = x;
              if(hint=="Ensure Password") kPassword2 = x;
            },
          ),
        ),
      ],
    );
  }
}
