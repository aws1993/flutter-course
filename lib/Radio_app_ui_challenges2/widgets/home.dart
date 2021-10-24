import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.85,
      height: double.infinity,
      color: Color(0xff01012A),
      child: Padding(
        padding: const EdgeInsets.only(top: 50,left: 20 ,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                            children: [
                              TextSpan(text: 'Hello' ,style: TextStyle(color: Colors.white ,fontSize: 25)),
                              TextSpan(text: 'Miau' ,style: TextStyle(color: Color(0xffff296d) ,fontSize: 25))
                            ]
                        ),



                      ),
                      Container(
                        width:50 ,
                        height:50 ,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image:AssetImage('images/img_1.png'),
                            )
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text('Popular', style: TextStyle(color: Colors.white ,fontSize: 25),),
                  SizedBox(height: 25,),
                  Row(

                    children: [
                      buildContainer(number: "90.5", name: "Divelment",iconData: Icons.favorite ,img: 'images/img_2.png',color: Color(0xffff296d),allColor: Colors.white),
                      SizedBox(width: 15,),
                      buildContainer(number: "94.3" ,name: "Diegoveloper" ,iconData: Icons.favorite_border,img: 'images/img_3.png',color: Color(0xff01012A),allColor: Color(0xff32324e)),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(

                    children: [
                      buildContainer(number: "94.3" ,name: "Diegoveloper" ,iconData: Icons.favorite_border,img: 'images/img_10.png',color: Color(0xff01012A),allColor: Color(0xff32324e)),
                      SizedBox(width: 15,),
                      buildContainer(number: "94.3" ,name: "Diegoveloper" ,iconData: Icons.favorite_border,img: 'images/img_11.png',color: Color(0xff01012A),allColor: Color(0xff32324e)),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(

                    children: [
                      buildContainer(number: "94.3" ,name: "Diegoveloper" ,iconData: Icons.favorite_border,img: 'images/img_12.png',color: Color(0xff01012A),allColor: Color(0xff32324e)),
                      SizedBox(width: 15,),
                      buildContainer(number: "94.3" ,name: "Diegoveloper" ,iconData: Icons.favorite_border,img: 'images/img_13.png',color: Color(0xff01012A),allColor: Color(0xff32324e)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: size.width*0.6,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HexagonWidget(type: HexagonType.POINTY,
                      color: Color(0x1405D8E8),
                      width: size.width *0.15,
                      height: 45,
                      cornerRadius: 10,
                      child:Center(
                        child: Container(
                            width: 10,
                            child: Image.asset('images/img_8.png')),
                      ) ,

                    ),
                    Container(
                      width: 110,
                      height: 100,
                      child: Stack(
                        children: [
                          Positioned(

                              right: 10,
                              child: Container(
                                  width:80,child: Image.asset('images/img_4.png'))),
                          Positioned(
                            right: 15,
                            top: 5,
                            child: Container(
                                width: 70,
                                child: Image.asset('images/img_5.png')),
                          ),
                          Positioned(
                            top: 10,
                            right:0,
                            left: 10,

                            child: HexagonWidget(type: HexagonType.POINTY,
                              color: Color(0xffff296d),
                              width: size.width *0.6,
                              height: 65,
                              cornerRadius: 20,
                              child:Center(
                                child: Container(
                                    width: 20,
                                    child: Image.asset('images/img_9.png')),
                              ) ,

                            ),
                          ),

                        ],

                      ),
                    ),
                    HexagonWidget(type: HexagonType.POINTY,
                      color: Color(0x1405D8E8),
                      width: size.width *0.15,
                      height: 45,
                      cornerRadius: 10,
                      child:Center(
                        child: Container(
                            width: 10,
                            child: Image.asset('images/img_9.png')),
                      ) ,

                    ),


                  ],
                ),
              ),
            ),
            Row(
              children: [
                Icon(Icons.volume_up_outlined,color: Color(0xff32324e),),
                SizedBox(width: 10,),
                Stack(
                  children: [
                    Container(
                      width: size.width*0.5,
                      height: 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff32324e),
                      ),
                    ),
                    Container(
                      width: size.width*0.3,
                      height: 3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff05d8e8)
                      ),
                    ),


                  ],
                ),
                SizedBox(width: 5,),
                Text("65%" ,style: TextStyle(color: Colors.white ,fontSize: 10),)
              ],
            )


          ],
        ),
      ),
    );
  }
  Container buildContainer({String? number ,String? name ,String? img ,IconData? iconData ,Color? color ,required Color allColor}) {
    return Container(
      width: 130,
      height: 140,
      decoration: BoxDecoration(
        border: Border.all(width: 1 ,color: allColor),
        borderRadius: BorderRadius.circular(20),
        color: color,

      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Playing',style: TextStyle(color: Color(0xff01012A),fontSize: 10),),
                Icon(iconData ,color: allColor,size: 20,)
              ],
            ),
            SizedBox(height: 10,),
            Text(number.toString() ,style: TextStyle(fontSize: 30 ,fontWeight: FontWeight.bold ,color: allColor),),
            Text(name.toString() ,style: TextStyle(fontSize: 16 ,color: allColor),),
            SizedBox(height: 10,),
            Container(
              width: 75,
              height: 20,
              child: Image.asset(img.toString()),
            )
          ],
        ),
      ),
    );
  }
}



