import 'package:nature_finder/utilites/comment.dart';
import 'package:nature_finder/utilites/user_data.dart';
class PostData {
  UserData _userData;
  String _description, _pic;
  List<Comment> _comments;

  PostData(this._userData, this._description, this._pic, this._comments);
  getUserName() => _userData.name;
  getUserProfile() => _userData.profile;
  getDescription()=> _description;
  getComments()=> _comments;
  getPic()=> _pic;
}
