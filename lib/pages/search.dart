import 'package:contacts_01/data/local_data.dart';
import 'package:flutter/material.dart';
class Search extends StatefulWidget {


  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          itemCount: listData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3/2,
            mainAxisSpacing:5,
            crossAxisSpacing: 5,
            crossAxisCount: 2,
          ),
          itemBuilder:(context, int index){
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(listData[index].imgUrl.toString())
                )
              ),
            );
          } ),
    );
  }

}
