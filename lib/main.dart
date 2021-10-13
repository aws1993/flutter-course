import 'package:contacts_01/data/local_contact.dart';
import 'package:contacts_01/pages/home.dart';
import 'package:contacts_01/pages/profile.dart';
import 'package:contacts_01/pages/recent.dart';
import 'package:contacts_01/pages/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'model/contact.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static late List<Widget> _pages;

  _MyHomePageState() {
    _pages = [
       HomeScreen(),
      Recent(),
      Profile(),
      // Search(),

    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.camera_alt ,color: Colors.black,),
            Text('Instagram',style: TextStyle(fontFamily: 'Tajawal' ,color: Colors.black),),
            Icon(Icons.send,color: Colors.black,)
          ],
        ),
      ),
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_contact_cal),
            label: 'Recent',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'favorite',

          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
