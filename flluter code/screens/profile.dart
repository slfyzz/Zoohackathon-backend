import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nature_finder/utilites/constants.dart';
import 'package:nature_finder/utilites/user_data.dart';
import 'package:nature_finder/widgets/separator.dart';

class ProfileScreen extends StatelessWidget {
  UserData user;

  ProfileScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: new BoxConstraints.expand(),
      color: Colors.lightGreen[300],
      child: new Stack(
        children: <Widget>[
          _getBackground(),
          _getGradient(),
          _getSummery(context),
        ],
      ),
    );
  }

  Container _getBackground() {
    return new Container(
      child: new Image.network(
        user.cover,
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
        new UserSummary(user),
        Center(
            child: Text(
          "My Posts",
          style: big,
        )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: getPosts(user.pics, context),
        )
      ],
    );
  }

  List<Widget> getPosts(List<String> urls, BuildContext context) {
    List<Widget> list = [];
    for (String s in urls)
      list.add(Container(
        color: Colors.white70,
        padding: EdgeInsets.only(bottom: 5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hey I took this pic last week in Egypt!"),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  s,
                  width: MediaQuery.of(context).size.width * .9,
                ),
              ),
            ],
          ),
        ),
      ),);
    return list;
  }
}

class UserSummary extends StatelessWidget {
  final UserData user;

  UserSummary(this.user);

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.center,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(user.profile),
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
            user.name,
            style: big,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.mail),
              new Text(
                user.mail,
                style: mid,
              ),
              SizedBox(
                height: 10,
              ),
              Icon(Icons.score),
              new Text(
                "Score : ${user.score}",
                style: mid,
              ),
            ],
          ),
          new Separator(),
        ],
      ),
    );

    final planetCard = new Container(
      child: planetCardContent,
      height: 280.0,
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
