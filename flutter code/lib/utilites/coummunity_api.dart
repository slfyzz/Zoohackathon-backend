import 'package:http/http.dart' as http;
import 'package:nature_finder/utilites/comment.dart';
import 'package:nature_finder/utilites/constants.dart';
import 'dart:convert' as convert;

import 'package:nature_finder/utilites/postData.dart';
import 'package:nature_finder/utilites/user_data.dart';

class CommunityAPI {
  List<PostData> getCommunityPots() {
    List<PostData> posts = [];
    posts.add(PostData(
        userData4,
        "If we are ranked first in ZooHackathon 🤣",
        "https://i1.wp.com/bloggingwithdona.com/wp-content/uploads/2020/02/maxresdefault-112.jpg",
        []));
    
    posts.add(PostData(
        userData1,
        "The BIG one",
        "https://www.paigntonzoo.org.uk//userfiles/events/SitaBlackRhinoLR-6.jpg",
        []));
    posts.add(PostData(
        userData3,
        "My hero 😁",
        "https://c.files.bbci.co.uk/CAB1/production/_98698815_tiger.jpg",
        []));
    posts.add(PostData(
        userData2,
        "Sleepy face 😊",
        "https://data.whicdn.com/images/343675537/original.jpg",
        []));

    return posts;
    // http.Response jsonData =
    //     await http.get("https://serene-sea-95236.herokuapp.com/community");
    // if (jsonData.statusCode == 200) {
    //   List<Map<String,dynamic>> list = convert.jsonDecode(jsonData.body);
    //
    //   List<PostData> data = [];
    //   for (Map content in list) {
    //     List<Comment> postComments = [];
    //     for (dynamic d in content['post']['comments']) {
    //       postComments.add(Comment(d['comment']));
    //     }
    //     String postDescription = content['post']['content'];
    //     String postImg = content['post']['img'];
    //     String userName = content['user'];
    //     String profilePic = content['profile'];
    //     data.add(PostData(UserData(userName, " ", " ", profilePic),
    //         postDescription, profilePic, postComments));
    //   }
    //   return data;
    // } else {
    //   throw Exception("error ${jsonData.statusCode} in getting data");
    // }
  }
}
