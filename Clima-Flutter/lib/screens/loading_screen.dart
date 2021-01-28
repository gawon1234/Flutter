import 'package:flutter/material.dart';
import 'location_screen.dart' ;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/services/networking.dart';

var weatherData;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  Future<void> initState()   {
      // TODO: implement initState
    super.initState();
    print("init");
    getLocationnData();

  }

  void getLocationnData() async {

    Navigator.push(context, MaterialPageRoute(builder: (context){
        return LocationScreen(  );
    }) );


    print( "latitude/ longtitude = " + latitude.toString() + " / " + longitude.toString() );

  }


  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: SpinKitRotatingCircle(
        color: Colors.white,
        size: 50,
      ),
    );


  }




}
