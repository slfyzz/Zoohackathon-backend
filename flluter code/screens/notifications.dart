import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nature_finder/utilites/constants.dart';
import 'package:nature_finder/widgets/notification.dart';
class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen[100],
      child: ListView(
        children: getNotifications(),
      ),
    );
  }

  List<Widget> getNotifications(){
    return [
      MyNotification(userData3,"03:58 pm"),
      MyNotification(userData4,"02:48 pm"),
      MyNotification(userData2,"03:33 pm"),

      MyNotification(userData3,"01:50 pm"),
      MyNotification(userData4,"01:00 pm"),
      MyNotification(userData2,"12:33 am"),

      MyNotification(userData3,"07:38 am"),
      MyNotification(userData4,"06:44 am"),
      MyNotification(userData2,"04:53 am"),

    ];
  }
}
