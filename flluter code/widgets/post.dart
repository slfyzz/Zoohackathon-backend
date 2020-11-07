import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nature_finder/utilites/constants.dart';
import 'package:nature_finder/utilites/post.dart';

class Post extends StatelessWidget {
  final PostData data;

  Post(this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
        color: Colors.white70,
        padding: EdgeInsets.only(bottom: 5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(data.getUserProfile()),
              ),
              Text(
                data.getUserName(),
                style: small,
              ),
              Text(data.description),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  data.pic,
                  width: MediaQuery.of(context).size.width * .9,
                ),
              ),
              SizedBox(height: 10,),
              FlatButton(
                onPressed: () {  },
                child: Column(
                  children: [
                    Icon(Icons.chat),
                    Text("Comment")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
