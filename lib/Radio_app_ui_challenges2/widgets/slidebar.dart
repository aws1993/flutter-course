import 'package:flutter/material.dart';
class SlideBar extends StatelessWidget {
  const SlideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: size.width * 0.15,
      decoration: BoxDecoration(
        color: Color(0xff080833),
      ),
      child:RotatedBox(
        quarterTurns: 3,
        child: Stack(
          children: [
            Positioned(
              right: 60,
              top: 15,
              child: Container(
                  width: 30,
                  height: 30,
                  child: RotatedBox(
                      quarterTurns: 1,
                      child: Image.asset('images/img.png' ,))),
            ),
            Positioned(
                right: size.height * 0.30,
                top: 15,
                child: Text("AllStation" ,style: TextStyle(color:  Color(0xff32324e),fontSize: 18),)),
            Positioned(
                right: size.height * 0.49 ,
                top: 15,
                child: Text("Favorites" ,style: TextStyle(color:  Color(0xff32324e),fontSize: 18),)),
            Positioned(
                right: size.height * 0.68 ,
                top: 15,
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff05d8e8)
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text("Popular" ,style: TextStyle(color:  Colors.white,fontSize: 18),),
                  ],
                ))
          ],
        ),
      ),

    );
  }
}
