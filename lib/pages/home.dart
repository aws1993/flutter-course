import 'package:contacts_01/data/local_data.dart';
import 'package:contacts_01/model/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPostsList(),
    );
  }
  Widget buildPoststItem(Post post){
    return Padding(padding: EdgeInsets.all( 10),
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
               Container(
                 height: 60,
                 width: 60,
                 padding: EdgeInsets.all(3),
                 margin: EdgeInsets.only(right: 10),
                 decoration: BoxDecoration(
                   gradient: LinearGradient(
                     begin: Alignment.topRight,
                     end: Alignment.bottomLeft,
                     colors: [
                       Colors.red,
                       Colors.yellow
                     ]
                   ),
                   borderRadius: BorderRadius.circular(30),
                 ),
                 child: Container(
                   width: 70,
                   height: 70,
                   decoration: BoxDecoration(
                     border: Border.all(width: 3,color: Colors.white),
                     borderRadius: BorderRadius.circular(35),
                     image: DecorationImage(
                       image: NetworkImage(post.imgUrlProfile.toString()),
                       fit: BoxFit.cover,
                     )

                   ),
                 ),
               ),
                Text(post.title.toString() , style: TextStyle(fontSize: 15 ,fontWeight: FontWeight.bold),)
              ],
            ),
            IconButton(onPressed: (){}, icon:Icon(Icons.more_horiz))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
         width: double.infinity,
          height: MediaQuery.of(context).size.height /2,
          child: Image(
            image: NetworkImage(post.imgUrl.toString()),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border ,size: 20,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.mode_comment_outlined ,size: 20,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.share ,size: 20,))
              ],
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.bookmark ,size: 20,))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        RichText(text: TextSpan(children: [
          TextSpan(text: post.numLike ,style: TextStyle(color: Colors.black)),
          TextSpan(text: 'Like' ,style: TextStyle(color: Colors.indigo ,fontWeight: FontWeight.bold)),
        ])),
        SizedBox(
          height: 10,
        ),
       Text(
         'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
         overflow: TextOverflow.ellipsis,
         maxLines: 3,
       )
      ],
    ) ,);
  }
  Widget buildPostsList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return buildPoststItem(listData[index]);
      },
      itemCount: listData.length,
    );
  }
}
