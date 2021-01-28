import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

double temperature;
int condition;
WeatherModel wm = WeatherModel() ;
double longitude, latitude;
var weatherData;
String apikey = '51dd1c4c5c013a06bc008b60436d6aff';

class LocationScreen extends StatefulWidget {
  final  locationWeather;
  //LocationScreen(){}



  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    updateUI( widget.locationWeather);
    print( widget.locationWeather );
  }


  void getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentLocation();

    latitude = loc.latitude;
    longitude = loc.longitude;

    Networking net = Networking('http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey' );
    weatherData = await net.getData(latitude, longitude, apikey);
  }

  void updateUI(weatherData){
     temperature = weatherData['main']['temp'];
     condition = weatherData['weather'][0]['id'];

  }



  @override
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
                    onPressed: () {},
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
mainAxisAlignment: MainAxisAlignment.spaceBetween ,

                  children: <Widget>[
                    Text(
                      temperature.toString() ,
                      style: kTempTextStyle,
                    ),
                    Text(
                       wm.getWeatherIcon(condition) ,

                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  wm.getMessage(temperature.toInt() ),
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
