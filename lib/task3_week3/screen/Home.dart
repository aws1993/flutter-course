import 'package:contacts_01/task3_week3/api/wetherapi.dart';
import 'package:contacts_01/task3_week3/model/daily.dart';
import 'package:contacts_01/task3_week3/screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';


import 'error.dart';
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WetherApi wetherApi = WetherApi();
  final f = DateFormat('hh:mm');
  final d = DateFormat.E()  ;
  TextEditingController _textEditingController =TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_textEditingController.text);
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.deepPurple,
          title: TextField(
            style: TextStyle(color: Colors.white,fontSize: 20),
            controller: _textEditingController,


            decoration:  InputDecoration(
              filled: true,
              fillColor: Colors.deepPurple,
              border: InputBorder.none,




              prefixIcon: const Icon(Icons.location_on_outlined ,size: 25,color: Colors.white,),
              suffixIcon:  const Icon(Icons.search ,size: 25,color: Colors.white,),
              hintText: 'Florida',
              hintStyle: TextStyle(color: Colors.white ,fontSize: 18),



            ),
            onEditingComplete: (){
              setState(() {

              });
            },

          )
      ),
      body: _textEditingController.text.isEmpty?FutureBuilder<Tuple2<ErrorResponse?, AutoGenerate?>>(
        future: wetherApi.FechDataDaily(),
        builder: (context, AsyncSnapshot<Tuple2<ErrorResponse?, AutoGenerate?>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else {

            if (snapshot.data?.item1 != null) {
              return Container(

                height: double.infinity,
                padding: EdgeInsets.only(top: 50),
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
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.data!.item1!.message,style: TextStyle(color: Colors.white ,fontSize: 20),textAlign: TextAlign.center,),
                      SizedBox(height: 10,),
                      ElevatedButton(onPressed: (){
                        setState(() {

                        });
                      }, child: Text('Try Again'))
                    ],
                  ),
                ),
              );

            }else {
              return Container(
                padding: EdgeInsets.only(top: 50),
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
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          snapshot.data!.item2!.location.name.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                        child: Text(
                          snapshot.data!.item2!.location.localtime.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                            "https:${snapshot.data!.item2!.current.condition.icon.toString()}"),
                        Text(
                          ((snapshot.data!.item2!.current.tempC).toInt()).toString(),
                          style: TextStyle(color: Colors.white, fontSize: 75),
                        ),
                      ],
                    ),
                    Center(
                        child: Text(
                          snapshot.data!.item2!.current.condition.text.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20, bottom: 10, top: 50),
                      child: Text(
                        'Hourly',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(20)),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 15 ,top: 20 ,left: 10),
                                child: Column(
                                  children: [
                                    Text(
                                      f.format(DateTime.parse(snapshot.data!.item2!.forecast
                                          .forecastday[0].hour[index].time)),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      child: Image.network("https:${snapshot.data!.item2!.forecast
                                          .forecastday[0].hour[index].condition.icon}"),
                                    ),

                                    Row(
                                      children: [
                                        Icon(Icons.wb_cloudy ,color: Colors.white,),
                                        SizedBox(width: 10,),
                                        Text("${snapshot.data!.item2!.forecast.forecastday[0].hour[index].chanceOfRain.toString()}%",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 25,),

                                    Text(snapshot.data!.item2!.forecast.forecastday[0].hour[index].tempC.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),

                                  ],
                                ),
                              );
                            },
                            itemCount:
                            snapshot.data!.item2!.forecast.forecastday[0].hour.length,
                          ),

                        ),
                        Positioned(
                          right:120,
                          bottom: 10,
                          child: Container(
                            width: 150,
                            height: 30,
                            child: Center(child: Text(' 24 Hours' ,style: TextStyle(color: Colors.white ,fontSize: 18),)),
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        )

                      ],
                    ),


                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20, bottom: 10, top: 50),
                      child: Text(
                        'Daily',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(20)),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 75 ,top: 20 ,left: 10),
                                child: Column(
                                  children: [
                                    Text(
                                      d.format(DateTime.parse(snapshot.data!.item2!.forecast
                                          .forecastday[index].date)),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    SizedBox(height: 10,),
                                    Image.network("https:${snapshot.data!.item2!.forecast
                                        .forecastday[index].day.condition.icon}"),

                                    Row(
                                      children: [
                                        Icon(Icons.wb_cloudy ,color: Colors.white,),
                                        SizedBox(width: 10,),
                                        Text("${snapshot.data!.item2!.forecast.forecastday[index].day.dailyChanceOfRain.toString()}%",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Text(snapshot.data!.item2!.forecast.forecastday[index].day.maxtempC.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                        height: 20,
                                        width: 5,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),

                                      ),
                                    ),
                                    Text(snapshot.data!.item2!.forecast.forecastday[index].day.mintempC.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),


                                  ],
                                ),
                              );
                            },
                            itemCount:
                            snapshot.data!.item2!.forecast.forecastday.length,
                          ),

                        ),
                        Positioned(
                          right:120,
                          bottom: 10,
                          child: Container(
                            width: 150,
                            height: 30,
                            child: Center(child: Text(' 3 Days' ,style: TextStyle(color: Colors.white ,fontSize: 18),)),
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        )

                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              );
            }
          }
        },
      ):FutureBuilder(
        future: wetherApi.FechDataDaily(name: _textEditingController.text),
        builder: (context, AsyncSnapshot<Tuple2<ErrorResponse?, AutoGenerate?>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  SplashScreen();
          } else {
            if (snapshot.data?.item1 != null){
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
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data!.item1!.message,style: TextStyle(color: Colors.white ,fontSize: 20),textAlign: TextAlign.center,),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: (){
                      setState(() {

                      });
                    }, child: Text('Try Again'))
                  ],
                ),
              );


            } else {
              return Container(
                padding: EdgeInsets.only(top: 50),
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
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          snapshot.data!.item2!.location.name.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                        child: Text(
                          snapshot.data!.item2!.location.localtime.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                            "https:${snapshot.data!.item2!.current.condition.icon.toString()}"),
                        Text(
                          ((snapshot.data!.item2!.current.tempC).toInt()).toString(),
                          style: TextStyle(color: Colors.white, fontSize: 75),
                        ),
                      ],
                    ),
                    Center(
                        child: Text(
                          snapshot.data!.item2!.current.condition.text.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20, bottom: 10, top: 50),
                      child: Text(
                        'Hourly',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(20)),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 15 ,top: 20 ,left: 10),
                                child: Column(
                                  children: [
                                    Text(
                                      f.format(DateTime.parse(snapshot.data!.item2!.forecast
                                          .forecastday[0].hour[index].time)),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      child: Image.network("https:${snapshot.data!.item2!.forecast
                                          .forecastday[0].hour[index].condition.icon}"),
                                    ),

                                    Row(
                                      children: [
                                        Icon(Icons.wb_cloudy ,color: Colors.white,),
                                        SizedBox(width: 10,),
                                        Text("${snapshot.data!.item2!.forecast.forecastday[0].hour[index].chanceOfRain.toString()}%",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 25,),

                                    Text(snapshot.data!.item2!.forecast.forecastday[0].hour[index].tempC.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),

                                  ],
                                ),
                              );
                            },
                            itemCount:
                            snapshot.data!.item2!.forecast.forecastday[0].hour.length,
                          ),

                        ),
                        Positioned(
                          right:120,
                          bottom: 10,
                          child: Container(
                            width: 150,
                            height: 30,
                            child: Center(child: Text(' 24 Hours' ,style: TextStyle(color: Colors.white ,fontSize: 18),)),
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        )

                      ],
                    ),


                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20, bottom: 10, top: 50),
                      child: Text(
                        'Daily',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(20)),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 75 ,top: 20 ,left: 10),
                                child: Column(
                                  children: [
                                    Text(
                                      d.format(DateTime.parse(snapshot.data!.item2!.forecast
                                          .forecastday[index].date)),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    SizedBox(height: 10,),
                                    Image.network("https:${snapshot.data!.item2!.forecast
                                        .forecastday[index].day.condition.icon}"),

                                    Row(
                                      children: [
                                        Icon(Icons.wb_cloudy ,color: Colors.white,),
                                        SizedBox(width: 10,),
                                        Text("${snapshot.data!.item2!.forecast.forecastday[index].day.dailyChanceOfRain.toString()}%",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Text(snapshot.data!.item2!.forecast.forecastday[index].day.maxtempC.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                        height: 20,
                                        width: 5,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),

                                      ),
                                    ),
                                    Text(snapshot.data!.item2!.forecast.forecastday[index].day.mintempC.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),


                                  ],
                                ),
                              );
                            },
                            itemCount:
                            snapshot.data!.item2!.forecast.forecastday.length,
                          ),

                        ),
                        Positioned(
                          right:120,
                          bottom: 10,
                          child: Container(
                            width: 150,
                            height: 30,
                            child: Center(child: Text(' 3 Days' ,style: TextStyle(color: Colors.white ,fontSize: 18),)),
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        )

                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              );
            }
          }
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}