import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nature_finder/screens/animals_list.dart';

class CountryCard extends StatelessWidget {
  String name;
  String flag;
  CountryCard({this.name,this.flag});
  @override
  Widget build(BuildContext context) {
    return Container(
      color:
      Colors.lightGreen[50],
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: FlatButton(
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>AnimalsListScreen(name)));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(flag),
              Text(name),
            ],
          ),
        ),
      ),
    );
  }
}

