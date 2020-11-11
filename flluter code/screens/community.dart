import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nature_finder/utilites/constants.dart';
import 'package:nature_finder/utilites/post.dart';
import 'package:nature_finder/widgets/post.dart';

class CommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen[100],
      child: ListView(
        children: getPosts(),
      ),
    );
  }

  List<Widget> getPosts() {
    return [
      Post(
        PostData(userData2, "Hi There what about this!",
            "https://dkt6rvnu67rqj.cloudfront.net/cdn/ff/ytC1AACWZWsYAdoh8eF6gr1Vqpeh0zruLRlIFRrsDXQ/1579019906/public/styles/600x400/public/media/int_files/cat_in_cage_at_cat_shelter_in_indonesia.jpg"),
      ),
      Post(
        PostData(userData3, "So cute ❤",
            "https://cdn.givingcompass.org/wp-content/uploads/2018/08/30102030/How-We-Protect-Endangered-Animals-800x450.jpg"),
      ),
      Post(
        PostData(userData1, "Just in time",
            "https://i.insider.com/5f3fe11189aff80028ab71ff?width=750&format=jpeg"),
      ),
      Post(
        PostData(userData4, "Let's fight 😂",
            "https://d279m997dpfwgl.cloudfront.net/wp/2019/08/GrooMelissa-7-1.jpg"),
      ),
    ];
  }
}
