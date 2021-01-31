import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen(this.locationWeather);
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override

  var weatherDescription;
  int temp;
  String cityName;
  var wm;
  String weatherMessage;
  String weatherIcon;

  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI( widget.locationWeather );
  }

  void updateUI(var weatherData){

    setState(() {
      if(weatherData == null){
        temp = 0;
        weatherIcon = "Error";
        weatherMessage = "error";
        cityName = "error";
        return ;
      }


      weatherDescription = weatherData['weather'][0]['main'];
      temp = weatherData['main']['temp'].toInt();
      cityName = weatherData['name'];
      //print("222 : " +  weatherDescription +  " // " + temp.toString()  + " // " + cityName );

      wm = WeatherModel();
      weatherMessage = wm.getMessage(temp);
      weatherIcon = wm.getWeatherIcon(temp);
    });


  }



  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      print("printed");
                      WeatherModel wm = WeatherModel();
                      updateUI( await wm.getLocationWeather() );

                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in $cityName"  ,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

