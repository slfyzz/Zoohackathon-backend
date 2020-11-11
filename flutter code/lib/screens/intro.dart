import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nature_finder/widgets/app_bar.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo_with_name.png'),
            RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/login');
              },
              elevation: 0,
              child: Container( width: 200,child: Center(child: Text("LOG IN"))),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/sign_up');
              },
              elevation: 0,
              child: Container( width: 200,child: Center(child: Text("SIGN UP"))),
            ),

          ],
        ),
      ),
    );
  }
}
