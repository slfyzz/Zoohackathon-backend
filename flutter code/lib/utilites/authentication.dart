import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:nature_finder/utilites/constants.dart';
import 'package:nature_finder/utilites/user_data.dart';


class Auth{
  Future<bool> signUp(String mail,String name,String pass1,String pass2,) async{
    http.Response r = await http.post(
      'https://serene-sea-95236.herokuapp.com/register',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(
        <String, String>{
          'email': mail,
          'password': pass1,
          'password2': pass2,
          'name': name,
          'country': "Global",
        },
      ),
    );

    bool status = false;
    try{
      dynamic content = convert.jsonDecode(r.body);
      print(content["success"]);
      if (content["success"] == "Welcome $name to Nature Finder") status= true;
      kUserData = UserData(content['user']['name'],content['user']['email'],content['user']['cover'],content['user']['profile']);
    }catch (e){
      return false;
    }
    return status;

  }

  Future<bool> logIn(String mail,String pass) async{
    http.Response r = await http.post(
      'https://serene-sea-95236.herokuapp.com/login',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(
        <String, String>{
          'email': mail,
          'password': pass,
        },
      ),
    );

    bool status = false;
    try{
      dynamic content = convert.jsonDecode(r.body);
      print(r.body);
      print(content["success"]);
      if (content["success"] == "logged in successfully") status= true;
      kUserData = UserData(content['user']['name'],content['user']['email'],content['user']['cover'],content['user']['profile']);
    }catch (e){
      return false;
    }
    return status;
  }

}