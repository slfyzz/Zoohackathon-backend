import 'package:flutter/cupertino.dart';

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: new EdgeInsets.symmetric(vertical: 8.0),
        height: 2.0,
        width: 50.0,
        color: Color(0xFFFFFFFF) ,
    );
  }
}