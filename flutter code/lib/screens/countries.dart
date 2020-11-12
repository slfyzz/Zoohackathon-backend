import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nature_finder/utilites/constants.dart';
import 'animals_list.dart';
import 'camera.dart';

class CountriesScreen extends StatefulWidget {
  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 200,
          child: Card(
            color: Colors.white70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Choose a country to display its animals",
                    style: mid,
                  ),
                ),
                CountryListPick(
                  appBar: AppBar(
                    backgroundColor: Colors.lightGreen,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_outlined),
                      onPressed: () {},
                      color: Colors.white,
                    ),
                    title: Text(
                      "Choose your country",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  theme: CountryTheme(
                    isShowFlag: true,
                    isShowTitle: true,
                    isShowCode: false,
                    isDownIcon: true,
                    showEnglishName: true,
                  ),
                  initialSelection: '+20',
                  onChanged: (CountryCode code) {
                    print(code.name);
                    print(code.code);
                    print(code.dialCode);
                    print(code.flagUri);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AnimalsListScreen(code.name)));
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        CircleAvatar(
          backgroundColor: Colors.white70,
          radius: 40,
          child: FlatButton(
            child: Container(
              width: 40,
              child: Image.network(
                  "https://cdn3.iconfinder.com/data/icons/face-recognition-outline/64/13_Dog_Face_Recognition_tech-512.png"),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CameraScreen(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
//
// class CountriesScreen extends StatefulWidget {
//   List<Widget> cards;
//
//   @override
//   _CountriesScreenState createState() => _CountriesScreenState();
// }
//
// class _CountriesScreenState extends State<CountriesScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     getCards();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return widget.cards == null
//         ? Spinner()
//         : Container(
//             child: GridView.count(
//               crossAxisCount: 2,
//               children: widget.cards,
//             ),
//           );
//   }
//
//   void getCards() {
//     List<CountryCard> cardsFromAPI = [];
//     CountryAPI().getData().then((value) {
//       for (CountryData d in value) {
//         cardsFromAPI.add(CountryCard(
//           name: d.name,
//           flag: d.flag,
//         ));
//       }
//       setState(() {
//         widget.cards = cardsFromAPI;
//       });
//     });
//   }
// }
