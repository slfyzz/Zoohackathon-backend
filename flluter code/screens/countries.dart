import 'package:flutter/cupertino.dart';
import 'package:nature_finder/utilites/country_api.dart';
import 'package:nature_finder/utilites/country_data.dart';
import 'package:nature_finder/widgets/country_card.dart';
import 'package:nature_finder/widgets/spinner.dart';

class CountriesScreen extends StatefulWidget {
  List<Widget> cards;

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.cards == null
        ? Spinner()
        : Container(
            child: GridView.count(
              crossAxisCount: 2,
              children: widget.cards,
            ),
          );
  }

  void getCards() {
    List<CountryCard> cardsFromAPI = [];
    CountryAPI().getData().then((value) {
      for (CountryData d in value) {
        cardsFromAPI.add(CountryCard(
          name: d.name,
          flag: d.flag,
        ));
      }
      setState(() {
        widget.cards = cardsFromAPI;
      });
    });
  }
}
