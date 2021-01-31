import 'dart:convert';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override

  double temp;
  var weatherData;

  void initState() {
    super.initState();
    getLocationData();

  }

  void getLocationData() async{

    WeatherModel wm = WeatherModel();
    weatherData = await wm.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen( weatherData );
    }));


  }


  Widget build(BuildContext context) {
    return Scaffold(

    );
  }




}
