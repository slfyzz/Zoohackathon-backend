import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AdoptionScreen extends StatefulWidget {
  @override
  AdoptionScreenState createState() => AdoptionScreenState();
}

class AdoptionScreenState extends State<AdoptionScreen> {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://gifts.worldwildlife.org/gift-center/gifts/species-adoptions.aspx',
    );
  }
}