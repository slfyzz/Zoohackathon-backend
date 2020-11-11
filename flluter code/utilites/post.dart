import 'package:nature_finder/utilites/user_data.dart';

class PostData{
  UserData _userData;
  String description, pic;
  getUserName() => _userData.name;
  getUserProfile() => _userData.profile;

  PostData(this._userData, this.description, this.pic);
}