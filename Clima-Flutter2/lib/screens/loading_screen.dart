import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override

  double temp;
  var fetchedData;

  Widget build(BuildContext context) {
    return Scaffold(  
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
            //print("hello");

            getData();
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return LocationScreen();
            }));

          },
          child: Text('Get Location'),
        ),
      ),
    );
  }

  void getData(){

    var url = "http://api.openweathermap.org/data/2.5/weather?lat=37.785834&lon=-122.406417&appid=51dd1c4c5c013a06bc008b60436d6aff";
    var nw = Networking(url);
    fetchedData = nw.getData();
    temp = fetchedData['main']['temp'];

  }


}
