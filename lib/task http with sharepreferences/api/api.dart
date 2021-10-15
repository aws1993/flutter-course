


import 'dart:convert';


import 'package:contacts_01/task%20http%20with%20sharepreferences/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiRequset {
  List<String> listUserString =[];
  Future<List<User>> FechData() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));


    if (response.statusCode == 200) {
      var userMap = jsonDecode(response.body);

      List<User> listUser = userMap.map<User>((val) => User.fromJson(val)).toList();
      for(var a in listUser){
        listUserString.add(a.title.toString());
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList('listUsers', listUserString);

      return listUser;
    } else {
      throw Exception('Failed to load album');
    }
  }


}