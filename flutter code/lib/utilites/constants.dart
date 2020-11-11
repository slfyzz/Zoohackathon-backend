import 'package:flutter/cupertino.dart';
import 'package:nature_finder/screens/apotion.dart';
import 'package:nature_finder/screens/community.dart';
import 'package:nature_finder/screens/countries.dart';
import 'package:nature_finder/screens/notifications.dart';
import 'package:nature_finder/screens/profile.dart';
import 'package:nature_finder/utilites/user_data.dart';

String kUserName;
String kEmail;
String kPassword1;
String kPassword2;

TextStyle small = TextStyle(fontSize: 10);
TextStyle mid = TextStyle(fontSize: 15);
TextStyle big = TextStyle(fontSize: 40);

UserData kUserData = UserData(null, null,null,null);

UserData userData1 = UserData(
    "Ahmed Ali",
    "Ahmed@x.com",
    "https://scontent-pmo1-1.xx.fbcdn.net/v/t1.0-9/44377821_1041627109332474_8176769514197745664_n.jpg?_nc_cat=104&ccb=2&_nc_sid=19026a&_nc_ohc=_I_ScnYAb-UAX_9Ssp3&_nc_ht=scontent-pmo1-1.xx&oh=2ab1ee6a7993631da73457481d918351&oe=5FCACCFF",
    "https://scontent-pmo1-1.xx.fbcdn.net/v/t1.0-9/66533334_1215920308569819_144382176127877120_n.jpg?_nc_cat=106&ccb=2&_nc_sid=174925&_nc_ohc=BGgVl17ZiGUAX8uf8bF&_nc_ht=scontent-pmo1-1.xx&oh=a03d8eb212468baaa9b027b117b14b46&oe=5FCC99D5",
    );
UserData userData4 = UserData(
    "Mahmoud Mohamed",
    "Ahmed@x.com",
    "https://scontent-pmo1-1.xx.fbcdn.net/v/t1.0-9/44377821_1041627109332474_8176769514197745664_n.jpg?_nc_cat=104&ccb=2&_nc_sid=19026a&_nc_ohc=_I_ScnYAb-UAX_9Ssp3&_nc_ht=scontent-pmo1-1.xx&oh=2ab1ee6a7993631da73457481d918351&oe=5FCACCFF",
    "https://scontent-pmo1-1.xx.fbcdn.net/v/t1.0-9/66627568_2241819869207309_8144535075971661824_n.jpg?_nc_cat=100&ccb=2&_nc_sid=09cbfe&_nc_ohc=CjNfwYQ9mwEAX8us9k6&_nc_ht=scontent-pmo1-1.xx&oh=1bb8f9771e725ec68f082c3e5cefe4f7&oe=5FCBF01D",
    );
UserData userData2 = UserData(
    "Omar Emam",
    "Ahmed@x.com",
    "https://scontent-pmo1-1.xx.fbcdn.net/v/t1.0-9/44377821_1041627109332474_8176769514197745664_n.jpg?_nc_cat=104&ccb=2&_nc_sid=19026a&_nc_ohc=_I_ScnYAb-UAX_9Ssp3&_nc_ht=scontent-pmo1-1.xx&oh=2ab1ee6a7993631da73457481d918351&oe=5FCACCFF",
    "https://scontent-pmo1-1.xx.fbcdn.net/v/t1.0-9/87000082_484491978885463_3931003190287269888_o.jpg?_nc_cat=107&ccb=2&_nc_sid=09cbfe&_nc_ohc=9rir18yCUg8AX-4M17J&_nc_ht=scontent-pmo1-1.xx&oh=adb75f593cdde86efb684039439df96e&oe=5FCBF14B",
    );
UserData userData3 = UserData(
    "Emmy Jone",
    "Ahmed@x.com",
    "https://scontent-pmo1-1.xx.fbcdn.net/v/t1.0-9/44377821_1041627109332474_8176769514197745664_n.jpg?_nc_cat=104&ccb=2&_nc_sid=19026a&_nc_ohc=_I_ScnYAb-UAX_9Ssp3&_nc_ht=scontent-pmo1-1.xx&oh=2ab1ee6a7993631da73457481d918351&oe=5FCACCFF",
    "https://cdn.psychologytoday.com/sites/default/files/styles/image-article_inline_full/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=ji6Xj8tv",
    );
List<Widget> screens = [
  CountriesScreen(),
  CommunityScreen(),
  ProfileScreen(userData1),
  NotificationsScreen(),
  AdoptionScreen()
];
