import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:flutter/foundation.dart';

class User {
  String id;
  String email;
  String firstname;
  String lastname;
  String avatar;

  // User({
  //   this.id,
  //   this.email,
  //   this.firstname,
  //   this.lastname,
  //   this.avatar,
  // });
  User({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.avatar,
  });

  factory User.createUser(Map<String, dynamic> object) {
    return User(
      id: object["id"].toString(),
      email: object["email"],
      firstname: object["first_name"],
      lastname: object["last_name"],
      avatar: object["avatar"],
    );
  }

  static Future<User> getUserFormAPI(int id) async {
    String apiURL = "https://reqres.in/api/users/" + id.toString();

    var apiResult = await http.get(Uri.parse(apiURL));
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.createUser(userData);
  }
}

class UninitializedUser extends User {
  UninitializedUser()
      : super(id: '', email: '', firstname: '', lastname: '', avatar: '');
  // id: "2",
  // email: "janet.weaver@reqres.in",
  // firstname: "Janet",
  // lastname: "Weaver",
  // avatar: "https://reqres.in/img/faces/2-image.jpg");
}
