
import 'package:nature_finder/utilites/postData.dart';
class UserData{
  String _name,_mail,_cover,_profile;
  List<PostData> _posts = [
  ];

  UserData(String name,String mail,String cover, String profile){
    _name=name;
    _profile=profile;
    _mail=mail;
    _cover=cover;
    _posts.add(PostData(this, "The BIG one","https://www.paigntonzoo.org.uk//userfiles/events/SitaBlackRhinoLR-6.jpg",[]));
    _posts.add(PostData(this, "You can do it 😁","https://10mosttoday.com/wp-content/uploads/2013/07/Galapagos_giant_tortoise1-730x486.jpg",[]));
  }
  String get name => _name == null ? "_name":_name;
  get mail => _mail  == null ? "_mail":_mail;
  get profile => _profile  == null ? "https://image.freepik.com/free-vector/man-wearing-medical-mask-illustration_43623-756.jpg":_profile;
  get cover => _cover == null ? "https://www.paigntonzoo.org.uk//userfiles/events/SitaBlackRhinoLR-6.jpg":_cover;
  get posts => _posts == null ? [] :_posts;
}
