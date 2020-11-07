import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nature_finder/utilites/constants.dart';
import 'package:nature_finder/utilites/full_animal_data.dart';
import 'package:nature_finder/widgets/separator.dart';

class AnimalDetailsScreen extends StatelessWidget {
  final FullAnimalData animalData;

  AnimalDetailsScreen(this.animalData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: new BoxConstraints.expand(),
        color: Colors.lightGreen[300],
        child: new Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getSummery(context),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return new Container(
      child: new Image.network(
        animalData.coverPic,
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: new BoxConstraints.expand(height: 300.0),
    );
  }

  Container _getGradient() {
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[new Color(0x0090ee90), Colors.lightGreen[300]],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Widget _getSummery(BuildContext context) {
    return new ListView(
      padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        new AnimalSummary(animalData),
        new Container(
          padding: new EdgeInsets.symmetric(horizontal: 32.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                "Summary",
                style: mid,
              ),
              new Text(
                animalData.description,
                style: small,
              ),
              new Separator(),
              new Text(
                "Species",
                style: mid,
              ),
              new Text(
                animalData.species,
                style: small,
              ),
              new Separator(),
              new Text(
                "What it eats",
                style: mid,
              ),
              new Text(
                animalData.meals,
                style: small,
              ),
              new Separator(),
              new Text(
                "Environment",
                style: mid,
              ),
              new Text(
                animalData.environment,
                style: small,
              ),
              new Separator(),
              new Text(
                "Age range",
                style: mid,
              ),
              new Text(
                animalData.ageRange,
                style: small,
              ),
              // new Separator(),
              // new Text(
              //   "Countries where it lives",
              //   style: mid,
              // ),
              // new Text(
              //   animalData.countries,
              //   style: small,
              // ),
              new Separator(),
              new Text(
                "Use",
                style: mid,
              ),
              new Text(
                animalData.trade,
                style: small,
              ),
              new Separator(),
              new Text(
                "Conservation status",
                style: mid,
              ),
              new Text(
                animalData.status,
                style: small,
              ),
              new Separator(),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FlatButton(
                      color: Colors.red,
                      child: Text(
                        "Report an accident",
                        style: mid,
                      ),
                      onPressed: () {},
                    ),
                    FlatButton(
                      color: Colors.grey,
                      child: Text(
                        "View 3D model",
                        style: mid,
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => Scaffold(
                        //       body: WebView(
                        //         initialUrl:
                        //             "https://www.google.com/search?q=bangal+tiger&hl=en-EG",
                        //       ),
                        //     ),
                        //   ),
                        // );
                      },
                    ),
                    FlatButton(
                      color: Colors.blue,
                      child: Text(
                        "Visit it!",
                        style: mid,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class AnimalSummary extends StatelessWidget {
  final FullAnimalData animal;

  AnimalSummary(this.animal);

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.center,
      child: new Hero(
        tag: "img${animal.name}",
        child: CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(animal.profilePic),
        ),
      ),
    );

    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(16.0, 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(
            animal.name,
            style: big,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.flag),
              SizedBox(width: 10,),
              new Text(
                animal.species,
                style: small,
              ),
            ],
          ),
          new Separator(),
        ],
      ),
    );

    final planetCard = new Container(
      child: planetCardContent,
      height: 200.0,
      margin: new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: Colors.white70,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return new GestureDetector(
        child: new Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: new Stack(
        children: <Widget>[
          planetCard,
          planetThumbnail,
        ],
      ),
    ));
  }
}
