import 'package:flutter/material.dart';
class InfoCar extends StatefulWidget {
  const InfoCar({Key? key}) : super(key: key);

  @override
  _InfoCarState createState() => _InfoCarState();
}

class _InfoCarState extends State<InfoCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,

      body: SafeArea(
        bottom: false,
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 400,

              child: Stack(
                children: [

                  ClipPath(
                    clipper: AppBarClipper(),
                    child: Container(
                      height: 400,

                      decoration: BoxDecoration(

                        image: DecorationImage(
                          image: AssetImage(
                              'images/waves.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(icon: Icon(Icons.arrow_back_ios) ,color: Colors.white,onPressed: (){
                          Navigator.of(context).pop();
                        },),
                      ),


                    ),
                  ),
                  Positioned(
                  bottom: 0,
                    right: 45,

                    child: Container(
                      height: 350,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 260,
                              width: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft:  Radius.circular(50) ,topLeft:  Radius.circular(50),topRight:  Radius.circular(50)),
                                  color: Colors.white
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Red Audi" ,style: TextStyle(color: Colors.black,fontSize: 30 ,fontWeight: FontWeight.bold),),
                                    Text("4 doors | Audi A4 Sports" ,style: TextStyle(color: Colors.black45,fontSize: 16 ,fontWeight: FontWeight.bold),),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20,left: 65),
                                      child: Row(
                                        children: [
                                          Icon(Icons.star ,color: Colors.deepOrange,size: 20,),
                                          Icon(Icons.star ,color: Colors.deepOrange,size: 20,),
                                          Icon(Icons.star ,color: Colors.deepOrange,size: 20,),
                                          Icon(Icons.star ,color: Colors.deepOrange,size: 20,),
                                          Icon(Icons.star_border ,color: Colors.deepOrange,size: 20,),
                                          Text('(23.5k)',style: TextStyle(color: Colors.black45,fontSize: 16 ,fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20,left: 50),
                                      child: Row(
                                        children: [
                                         Column(
                                           children: [
                                             Icon(Icons.auto_awesome,color: Colors.black,),
                                             Text('Automatic' ,style: TextStyle(color: Colors.black),)
                                           ],
                                         ),
                                          SizedBox(width: 15,),
                                          Column(
                                            children: [
                                              Icon(Icons.ac_unit,color: Colors.black,),
                                              Text('Air Colne' ,style: TextStyle(color: Colors.black),)
                                            ],
                                          ),
                                          SizedBox(width: 15,),
                                          Column(
                                            children: [
                                              Icon(Icons.person,color: Colors.black,),
                                              Text('5 Seater' ,style: TextStyle(color: Colors.black),)
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 200,
                            right: 50,
                            child:   Container(

                            width: 200,
                            height: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/car1.png' ),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),)
                        ],
                      ),
                    ),
                  ),


                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(

              child: Padding(
                padding: const EdgeInsets.only(left: 15 ,right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,


                  children: [
                    Text('Trip Dates' ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(height: 15,),
                    Container(
                      width: 345,
                      child: Stack(
                        children: [
                          ClipPath(
                            clipper: ContainerClipper(),

                            child: Container(
                              height: 75,
                              width: 320,

                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topLeft: Radius.circular(20))

                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    child: Container(

                                      width: 40,
                                      height: 43,

                                      decoration: BoxDecoration(

                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.pinkAccent,
                                      ),
                                      child: const Center(
                                        child:  Center(child: Center(child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(Icons.shopping_bag ,color: Colors.white,size: 23,),
                                        ))),
                                      ),
                                    ),
                                  ),
                                  Text('03-07-2020 - 05-07-2020',style: TextStyle(fontWeight: FontWeight.bold ),)
                                ],
                              ),


                            ),
                          ),
                          Positioned(
                            right: 0,
                            top:12,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue
                              ),
                              child: Icon(Icons.arrow_forward_ios_outlined ,color: Colors.white,),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Trip Dates' ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(height: 15,),
                    Container(
                      width: 345,
                      child: Stack(
                        children: [
                          ClipPath(
                            clipper: ContainerClipper(),

                            child: Container(
                              height: 75,
                              width: 320,

                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topLeft: Radius.circular(20))

                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    child: Container(

                                      width: 40,
                                      height: 43,

                                      decoration: BoxDecoration(

                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.pinkAccent,
                                      ),
                                      child: const Center(
                                        child:  Center(child: Center(child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(Icons.shopping_bag ,color: Colors.white,size: 23,),
                                        ))),
                                      ),
                                    ),
                                  ),
                                  Text('03-07-2020 - 05-07-2020',style: TextStyle(fontWeight: FontWeight.bold ),)
                                ],
                              ),


                            ),
                          ),
                          Positioned(
                            right: 0,
                            top:12,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue
                              ),
                              child: Icon(Icons.arrow_forward_ios_outlined ,color: Colors.white,),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),




                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                    color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('Total' ,style: TextStyle(color: Colors.grey),),
                        Row(
                          children: [
                            Text('\$399' ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            Text('/ trip' ,style: TextStyle(color: Colors.grey),),

                          ],
                        )
                        ],
                      ),
                      Container(
                        width: 150,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text('Go to checkout' ,style: TextStyle(color: Colors.white),),
                        ),
                      )
                    ],
                  ),
                ),

              ),
            )



          ],
        ),
      ),
    );
  }
}
class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0,size.height-75);
    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height-75);
    path.lineTo(size.width,0 );





    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
class ContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width,0);
    path.lineTo(size.width,3);

    path.quadraticBezierTo(size.width-40, size.height-65, size.width-40, size.height/2);

    path.quadraticBezierTo(size.width-40, size.height-10, size.width, size.height-3);
    path.lineTo(size.width,size.height);


    path.lineTo(0,size.height);






    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
