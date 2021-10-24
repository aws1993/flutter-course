
import 'package:contacts_01/Radio_app_ui_challenges2/widgets/home.dart';
import 'package:contacts_01/Radio_app_ui_challenges2/widgets/slidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexagon/hexagon.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Row(
       children: [
         SlideBar(),
         Home(),
       ],
     ),
    );
  }


}
