
import 'package:contacts_01/task2_week2_car_ui/info.dart';
import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white70,

        body:ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 210,

              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50) , bottomRight: Radius.circular(50)),
                image: DecorationImage(
                  image: AssetImage(
                      'images/waves.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.notes ,color: Colors.white, size: 30,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 40,
                            height: 40,
                            child: Image.asset('images/p.jpg' ,fit: BoxFit.cover,),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),


                      ],
                    ),
                    SizedBox(height: 20,),
                    Text('Choose Car ' ,style: TextStyle(color: Colors.white ,fontSize: 20 ,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),

                    Row(
                      children: [
                        Expanded(child:  TextField(


                          decoration:  InputDecoration(
                            filled: true,
                            fillColor: Colors.white,

                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: const Icon(Icons.location_on_outlined ,size: 20,),
                            suffixIcon: Container(
                              margin: const EdgeInsets.only(right: 10 ,top: 5 ,bottom: 5),
                              width: 30,
                              height: 15,

                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(12),
                                color: Colors.pinkAccent,
                              ),
                              child: const Center(
                                child:  Center(child: Center(child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.shopping_bag ,color: Colors.white,size: 20,),
                                ))),
                              ),
                            ),
                            hintText: 'Florida, USA',
                            hintStyle: TextStyle(color: Colors.black ,fontSize: 18),

                          ),
                        ),),
                        SizedBox(width: 15,),
                        Icon(Icons.menu ,color: Colors.white,size: 30,)
                      ],
                    ),


                  ],
                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('23 Results' ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                  Icon(Icons.more_horiz,color: Colors.black,)

                ],
              ),
            ),
            buildContainer(),
            buildContainer(),



          ],
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Container buildContainer() {
    return Container(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 75,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.amberAccent,

                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Row(
                                  children: [
                                    Icon(Icons.star ,color: Colors.white, size: 20,),
                                    Text('4.3', style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold),)

                                  ],
                                ),
                              ),
                            ),
                          ),
                          Text('10 Deals' ,style: TextStyle(color: Colors.green ,fontWeight: FontWeight.bold ,fontSize: 16),)

                        ],),

                      Padding(
                        padding: EdgeInsets.only(top: 20 ,left: 40),
                        child: Container(

                          width: 200,
                          height: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/car1.png' ),
                                  fit: BoxFit.fill
                              )
                          ),
                        ),
                      ),
                      Text('Red Tesla' ,style: TextStyle(color: Colors.black ,fontSize: 20 ,fontWeight: FontWeight.bold),),
                      Text('From \$197 / dat' ,style: TextStyle(color: Colors.grey),)

                    ],
                  ),
                ),

              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 25,
            child: GestureDetector(
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InfoCar())),
              child: Container(
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue
                ),
                child: Icon(Icons.arrow_forward_ios_outlined ,color: Colors.white,),
              ),
            ),
          )


        ],
      ),
    );
  }
}
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0,size.height );
    path.lineTo(size.width-95,size.height  );
    path.quadraticBezierTo(size.width-75, size.height-5, size.width-75, size.height-20);
    path.quadraticBezierTo(size.width-75, size.height-80, size.width, size.height-75);
    path.lineTo(size.width-25,size.height-75  );
    path.quadraticBezierTo(size.width-3, size.height-75, size.width, size.height-90);
    path.lineTo(size.width,0 );




    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
