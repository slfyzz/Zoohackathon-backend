import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nature_finder/utilites/animal_data.dart';
import 'package:nature_finder/utilites/animals_api.dart';
import 'package:nature_finder/widgets/animal_card.dart';
import 'package:nature_finder/widgets/spinner.dart';

// ignore: must_be_immutable
class AnimalsListScreen extends StatefulWidget {
  final String country;
  List<Widget> animals;

  AnimalsListScreen(this.country);

  @override
  _AnimalsListScreenState createState() => _AnimalsListScreenState();
}

class _AnimalsListScreenState extends State<AnimalsListScreen> {
  void initState() {
    // TODO: implement initState
    getCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.animals == null
          ? Spinner()
          : Container(
              child: ListView(
                children: widget.animals,
              ),
            ),
    );
  }

  void getCards() {
    List<AnimalCard> cardsFromAPI = [];
    print(1);
    AnimalsAPI().getData(widget.country).then((value) {
      for (AnimalData d in value) {
        cardsFromAPI.add(AnimalCard(d));
      }
      setState(() {
        widget.animals = cardsFromAPI;
      });
    });
  }
}
