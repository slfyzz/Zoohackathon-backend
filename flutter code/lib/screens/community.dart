import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nature_finder/utilites/coummunity_api.dart';
import 'package:nature_finder/utilites/postData.dart';
import 'package:nature_finder/widgets/post.dart';
import 'package:nature_finder/widgets/spinner.dart';

// ignore: must_be_immutable
class CommunityScreen extends StatefulWidget {
  List<Post> postsWidgets;

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  void initState() {
    initialPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen[100],
      child: widget.postsWidgets == null
          ? Spinner()
          : ListView(
              children: widget.postsWidgets,
            ),
    );
  }

  // ignore: missing_return
  Future<void> initialPosts() {
    print("hi");

    widget.postsWidgets = [];
    for (PostData postData in CommunityAPI().getCommunityPots()) widget.postsWidgets.add(Post(postData));
    setState(() {
      print("hi");
    });
  }
}
