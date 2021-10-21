import 'dart:convert';


import 'package:contacts_01/task3_week3/model/daily.dart';
import 'package:contacts_01/task3_week3/model/wethermodel.dart';
import 'package:contacts_01/task3_week3/screen/error.dart';
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';


class WetherApi {
  Future<WeatherModel> FechData() async {
    var apiUrl = Uri.parse("https://api.weatherapi.com/v1/forecast.json?key=29922e5c340949c5ba683911211810&q=Baghdad&days=3&aqi=no&alerts=no");
    var response = await http.get(apiUrl);

    print(response.statusCode);
    if (response.statusCode == 200) {
      try{
        var wether = WeatherModel.fromJson(jsonDecode(response.body));
        print(wether);


        return wether;
      }
      catch(e){
        return throw Exception("Json parse error");
      }

    } else {
      throw Exception('network connection failed');
    }
  }
  Future<Tuple2<ErrorResponse?, AutoGenerate?>> FechDataDaily({String name = "Baghdad"}) async {
    var response;
    try {
      var apiUrl = Uri.parse(
          "https://api.weatherapi.com/v1/forecast.json?key=29922e5c340949c5ba683911211810&q=$name&days=3&aqi=no&alerts=no");
       response = await http.get(apiUrl);
      var dailay = AutoGenerate.fromJson(jsonDecode(response.body));
      return Tuple2(null, dailay);

      print(response.statusCode);



    }catch (e) {
      if (response?.statusCode == 200) {
        return Tuple2(ErrorResponse('There is currently a problem. Please try again later', response?.statusCode ?? -1), null);
      }
      return Tuple2(ErrorResponse('Please make sure you are connected to the internet', -1), null);

    }


  }



  }


