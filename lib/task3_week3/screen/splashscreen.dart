import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      height: double.infinity,
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple,
            Colors.lightBlueAccent,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          CircularProgressIndicator(),
          SizedBox(height: 20,),
          Text("waiting....." ,style: TextStyle(color: Colors.white ,fontSize: 25),),
        ],
      ),
    );
  }
}
