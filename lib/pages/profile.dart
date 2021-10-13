import 'package:contacts_01/data/local_data.dart';
import 'package:flutter/material.dart';
class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height *0.25,
            child: Image(
              image: NetworkImage(listData[0].imgUrl.toString()),
              fit: BoxFit.cover,
            ),
          ),
        SizedBox(
          height: 10,
        ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.call),
                    Text('call'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.message),
                    Text('Text'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.video_call),
                    Text('Set Up'),
                  ],
                ),
              ],
            ),
          ),
          Divider(color: Colors.black,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.call),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('0770776742'),
                      Text('SetUp')
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(color: Colors.black,),
          // Image.asset('images/a.jpg'),

        ],
      ),
    );
  }
}
