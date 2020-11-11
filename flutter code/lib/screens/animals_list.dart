import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nature_finder/utilites/animal_data.dart';
import 'package:nature_finder/utilites/animals_api.dart';
import 'package:nature_finder/utilites/full_animal_data.dart';
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/panda.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.black38,
        body: widget.animals == null
            ? Spinner()
            : Container(
                child: ListView(
                  children: widget.animals,
                ),
              ),
      ),
    );
  }

  void getCards() {
    List<Widget> cardsFromAPI = [];
    print(1);
    cardsFromAPI.add(SizedBox(height: 20,));
    AnimalsAPI().getAllAnimalsInCountry(widget.country).then((value) {
      for (FullAnimalData d in value) {
        cardsFromAPI.add(AnimalCard(d));
      }
      setState(() {
        widget.animals = cardsFromAPI;
      });
    });
  }
}
