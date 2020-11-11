import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nature_finder/utilites/constants.dart';
import 'package:nature_finder/utilites/user_data.dart';

class MyNotification extends StatelessWidget {
  final UserData data;
  final String time;
  MyNotification(this.data,this.time);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      color: Colors.white70,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(radius: 20, backgroundImage: NetworkImage(data.profile),),
              SizedBox(width: 20,),
              Text("${data.name} commented on your post"),
            ],
          ),
          Text(time,style: small,),
        ],
      ),
    );
  }
}
