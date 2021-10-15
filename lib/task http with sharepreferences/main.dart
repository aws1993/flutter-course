import 'dart:convert';


import 'package:contacts_01/task%20http%20with%20sharepreferences/api/api.dart';
import 'package:contacts_01/task%20http%20with%20sharepreferences/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  ApiRequset apiRequset =ApiRequset();
  List<String>? ls;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _prefs.then((value) {
      ls = value.getStringList('listUsers');

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(


      ),
      body: (ls !=null)?ListView.builder(
        itemBuilder: (context ,index){
          return Card(
            child: Text(ls![index].toString()),
          );
        },
      ) :FutureBuilder(
          future:apiRequset.FechData(),
          builder: (context, AsyncSnapshot<List<User>> snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.error != null) {
                print(snapshot.error);
                return const Center(
                  child: Text('An error occured'),
                );
                }

              else {
                return ListView.builder(itemBuilder: (context ,index){
                    return  Card(
                      child:Text(snapshot.data![index].title.toString() ) ,
                    );
                  },
                  itemCount: snapshot.data!.length );
              }
            }
          },
        ),
      );
  }
}
