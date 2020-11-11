import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nature_finder/screens/animal.dart';
import 'package:nature_finder/utilites/animal_data.dart';
import 'package:nature_finder/utilites/animals_api.dart';
import 'package:nature_finder/utilites/full_animal_data.dart';

class AnimalCard extends StatelessWidget {
  AnimalData data;

  AnimalCard(this.data);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        AnimalsAPI().getFullAnimalData(data.name).then((value){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>AnimalDetailsScreen(value),),);
        });
      },
      child: new Container(
          margin: const EdgeInsets.symmetric(
            vertical: 2.0,
          ),
          child: new Stack(
            children: <Widget>[
              card(),
              thumbnail(),
            ],
          )),
    );
  }

  Widget thumbnail() {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 5.0),
      alignment: FractionalOffset.centerLeft,
      child: Hero(
        tag: 'img${data.name}',
        child: CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(data.img),
        ),
      ),
    );
  }

  Widget card() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          height: 150,
          margin: new EdgeInsets.only(left: 46.0),
          decoration: new BoxDecoration(
            color:
                data.extinct ? Colors.redAccent[100] : Colors.lightGreen[100],
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Name : ${data.name}",
                ),
                Text("Species : ${data.species}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
